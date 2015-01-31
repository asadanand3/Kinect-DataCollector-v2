//------------------------------------------------------------------------------
// <copyright file="MainWindow.xaml.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------

namespace Microsoft.Samples.Kinect.DepthBasics
{
    using System;
    using System.Globalization;
    using System.IO;
    using System.Windows;
    using System.Windows.Media;
    using System.Windows.Media.Imaging;
    using Microsoft.Kinect;

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        /// <summary>
        /// Active Kinect sensor
        /// </summary>
        private KinectSensor kinectSensor = null;

        /// <summary>
        /// Reader for depth frames
        /// </summary>
        private DepthFrameReader depthFrameReader = null;

        /// <summary>
        /// Description of the data contained in the depth frame
        /// </summary>
        private FrameDescription depthFrameDescription = null;

        /// <summary>
        /// Bitmap to display
        /// </summary>
        private WriteableBitmap depthBitmap = null;

        /// <summary>
        /// Intermediate storage for frame data converted to color
        /// </summary>
        private byte[] depthPixels = null;
        private ushort[] depthValues = null;


        private int FrameCounter = 0;
        private bool IsRecording = false;
        private BinaryWriter writer;

        private double levelAvg = 0;

        /// <summary>
        /// Initializes a new instance of the MainWindow class.
        /// </summary>
        public MainWindow()
        {
            // get the kinectSensor object
            this.kinectSensor = KinectSensor.GetDefault();

            // open the reader for the depth frames
            this.depthFrameReader = this.kinectSensor.DepthFrameSource.OpenReader();

            // wire handler for frame arrival
            this.depthFrameReader.FrameArrived += this.Reader_FrameArrived;

            // get FrameDescription from DepthFrameSource
            this.depthFrameDescription = this.kinectSensor.DepthFrameSource.FrameDescription;

            // allocate space to put the pixels being received and converted
            this.depthPixels = new byte[this.depthFrameDescription.Width * this.depthFrameDescription.Height];
            this.depthValues = new ushort[this.depthFrameDescription.Width * this.depthFrameDescription.Height];

            // create the bitmap to display
            this.depthBitmap = new WriteableBitmap(this.depthFrameDescription.Width, this.depthFrameDescription.Height, 96.0, 96.0, PixelFormats.Gray8, null);

            // set IsAvailableChanged event notifier
            this.kinectSensor.IsAvailableChanged += this.Sensor_IsAvailableChanged;

            // open the sensor
            this.kinectSensor.Open();

            // use the window object as the view model in this simple example
            this.DataContext = this;

            // initialize the components (controls) of the window
            InitializeComponent();


            // set the status text
            this.statusBarText.Text = this.kinectSensor.IsAvailable ? Properties.Resources.RunningStatusText
                                                            : Properties.Resources.NoSensorStatusText;

            this.Image.Source = this.depthBitmap;

        }


        /// <summary>
        /// Execute shutdown tasks
        /// </summary>
        /// <param name="sender">object sending the event</param>
        /// <param name="e">event arguments</param>
        private void WindowClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (this.depthFrameReader != null)
            {
                // DepthFrameReader is IDisposable
                this.depthFrameReader.Dispose();
                this.depthFrameReader = null;
            }

            if (this.kinectSensor != null)
            {
                this.kinectSensor.Close();
                this.kinectSensor = null;
            }
        }

        /// <summary>
        /// Handles the depth frame data arriving from the sensor
        /// </summary>
        /// <param name="sender">object sending the event</param>
        /// <param name="e">event arguments</param>
        private void Reader_FrameArrived(object sender, DepthFrameArrivedEventArgs e)
        {
            bool depthFrameProcessed = false;

            using (DepthFrame depthFrame = e.FrameReference.AcquireFrame())
            {
                if (depthFrame != null)
                {
                    depthFrame.CopyFrameDataToArray(this.depthValues);
                    ProcessDepthFrameData(depthFrame.FrameDescription.LengthInPixels, depthFrame.DepthMinReliableDistance, depthFrame.DepthMaxReliableDistance);
                    depthFrameProcessed = true;
                }
            }

            if (depthFrameProcessed)
            {
                this.RenderDepthPixels();
            }

            if (FrameCounter % 3 == 0 && IsRecording)
                WriteBinFrame();

            levelAvg += CalculateLevel();
            if (FrameCounter % 30 == 0)
            {
                levelAvg /= 30;
                Degree.Text = levelAvg.ToString("F3");

                levelAvg = 0;
            }

            FrameCounter++;
        }

        /// <summary>
        /// Directly accesses the underlying image buffer of the DepthFrame to 
        /// create a displayable bitmap.
        /// This function requires the /unsafe compiler option as we make use of direct
        /// access to the native memory pointed to by the depthFrameData pointer.
        /// </summary>
        /// <param name="depthFrameData">Pointer to the DepthFrame image data</param>
        /// <param name="depthFrameDataSize">Size of the DepthFrame image data</param>
        /// <param name="minDepth">The minimum reliable depth value for the frame</param>
        /// <param name="maxDepth">The maximum reliable depth value for the frame</param>
        private void ProcessDepthFrameData(uint depthFrameDataSize, ushort minDepth, ushort maxDepth)
        {
            int depth;

            for (int i = 0; i < depthFrameDataSize; ++i)
            {
                // Get the depth for this pixel
                depth = this.depthValues[i];

                // Normalize depth
                depth = (255 * (depth - minDepth)) / maxDepth;
                if (depth < 0)
                    depth = 0;
                else if (depth > 255)
                    depth = 255;

                // save to bytes
                this.depthPixels[i] = (byte)depth;
            }
        }

        /// <summary>
        /// Renders color pixels into the writeableBitmap.
        /// </summary>
        private void RenderDepthPixels()
        {
            this.depthBitmap.WritePixels(
                new Int32Rect(0, 0, this.depthBitmap.PixelWidth, this.depthBitmap.PixelHeight),
                this.depthPixels,
                this.depthBitmap.PixelWidth,
                0);
        }


        /// <summary>
        /// Handles the user clicking on the screenshot button
        /// </summary>
        /// <param name="sender">object sending the event</param>
        /// <param name="e">event arguments</param>
        private void ButtonScreenshotClick(object sender, RoutedEventArgs e)
        {
            if (kinectSensor == null)
            {
                this.statusBarText.Text = Properties.Resources.ScreenshotFailed;
                return;
            }

            // create a png bitmap encoder which knows how to save a .png file
            BitmapEncoder encoder = new PngBitmapEncoder();

            // create frame from the writable bitmap and add to encoder
            encoder.Frames.Add(BitmapFrame.Create(this.depthBitmap));

            string time = System.DateTime.Now.ToString("hh'-'mm'-'ss", CultureInfo.CurrentUICulture.DateTimeFormat);

            string myPhotos = Environment.GetFolderPath(Environment.SpecialFolder.MyPictures);

            string path = Path.Combine(myPhotos, "KinectSnapshot-" + time + ".png");

            // write the new file to disk
            try
            {
                using (FileStream fs = new FileStream(path, FileMode.Create))
                {
                    encoder.Save(fs);
                }

                this.statusBarText.Text = string.Format(CultureInfo.InvariantCulture, "{0} {1}", Properties.Resources.ScreenshotWriteSucceeded, path);
            }
            catch (IOException ex)
            {
                this.statusBarText.Text = string.Format(CultureInfo.InvariantCulture, "{0} {1}", Properties.Resources.ScreenshotWriteFailed, path);
            }

        }

        // write to binary file
        private void WriteBinFrame()
        {
            DateTime time_stamp = System.DateTime.Now;
            //string time_stamp = System.DateTime.Now.ToString("hh:mm:ss.fff", CultureInfo.CurrentUICulture.DateTimeFormat);
            writer.Write((short)time_stamp.Hour);
            writer.Write((short)time_stamp.Minute);
            writer.Write((short)time_stamp.Second);
            writer.Write((short)time_stamp.Millisecond);

            for (int i = 0; i < this.depthPixels.Length; ++i)
            {
                // Get the depth for this pixel
                ushort depth = depthValues[i];
                writer.Write(depth);
            }
        }

        private void Record_Click(object sender, RoutedEventArgs e)
        {
            IsRecording = !IsRecording;

            Record.Content = IsRecording ? "Stop" : "Record";

            string myPath = Path.Combine("C:\\Airway Resistance_2014\\Airway_Data_2014\\Kinect Data");
           
            if (IsRecording)
            {
                string time = System.DateTime.Now.ToString("yyyy'-'M'-'d'-'hh'-'mm'-'ss", CultureInfo.CurrentUICulture.DateTimeFormat);
                //string myPhotos = Environment.GetFolderPath(c.MyPictures);
                string fname = String.Format("KinectDepth_Sub{0}_{1}.bin", Sub.Text, time);
                string path_bin= Path.Combine(myPath, fname);

                FileStream SourceStream = File.Open(path_bin, FileMode.OpenOrCreate, FileAccess.Write);
                writer = new BinaryWriter(SourceStream);
            }
            else
            {
                writer.Close();
            }
        }

        private void Exp_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        private void Straws_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        private void Subject_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        private double CalculateLevel()
        {
            double level, lever, val;
            int width, height, x, y, idx;
            int xmar, ymar;
            width = kinectSensor.DepthFrameSource.FrameDescription.Width;
            height = kinectSensor.DepthFrameSource.FrameDescription.Height;

            xmar = 200;
            ymar = 150;

            level = 0;
            idx = 0;
            for (y = 0; y < height; y++)
            {
                if (y < ymar || y > (height - ymar))
                    continue;

                for (x = 0; x < width; x++)
                {
                    if (x < xmar || x > (width - xmar))
                        continue;

                    idx = x + y * width;
                    val = this.depthValues[idx];
                    lever = y - height / 2;
                    level += lever * val;

                    idx++;
                }
            }
            level = level / width / height;

            return level;
        }

        /// <summary>
        /// Handles the event which the sensor becomes unavailable (E.g. paused, closed, unplugged).
        /// </summary>
        /// <param name="sender">object sending the event</param>
        /// <param name="e">event arguments</param>
        private void Sensor_IsAvailableChanged(object sender, IsAvailableChangedEventArgs e)
        {
            // on failure, set the status text
            this.statusBarText.Text = this.kinectSensor.IsAvailable ? Properties.Resources.RunningStatusText
                                                            : Properties.Resources.SensorNotAvailableStatusText;
        }
        
    }
}