   M S B A M L   `   `   `  ����  DepthBasics-WPF5    /Microsoft.Samples.Kinect.DepthBasics.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          � Title$  Depth Basics��5   	   $	��735��6   $��752.09��6+    � 	Resources 5         MediumGreyBrush �� Color  KinectPurpleBrush  KinectBlueBrush �� 
TargetType �� Property �� Value  SnapshotButton �� 
TargetType �� Orientation ��Name	 �� TextAlignment
 ��Name �� Triggers P� Property P� Value �� 
TargetName  SquareCheckBox �Name��%w
  &	        &	 #     &	 F     '�� i     &	 �     7  7  &	 �    7  7  �� 5   
   $ 	#ff6e6e6e��62   �� 5   
   $ 	#ff52318f��64   �� 5	   
   $ 	#ff00BCF2��62   �� 5
   
   " ��6   .�5      ��  �@J�SnapsToDevicePixels . 64   5      �� 5   
   " ��6   .�5      ��  � �� 5      �� 5      " ��6&   .R�5      � .+�5      �� $ 
Horizontal=�6)   
������ .+�5   "   �� $ SnapText��6,   #��z��6>   $
	 Left=�6_   $��Center=�6u   8��  $��15(�6�   � 5   "   $��9,0,0,0q�6'   .+�5   &   �� $
 
SnapNormal��6,   $��Images\SnapNormal.png��6@   $
��None=�6_   $��Center=�6n   �� 5   &   $
 	SnapHover��6,   $��Images\SnapHover.png��6?   $
��None=�6]   $��Center=�6l   $y�	Collapsed=�6�   5   #   5      5       5      P� 5       �@J�IsMouseOver . . �5   "   �� $ 
SnapNormal��6Q    � y�$ 	Collapsed=�6?   6Q   �� 5   "   $ 	SnapHover��6O    � y�$ Visible=�6?   6O   �� 5   "   8  $ SnapText��6h    � ��5      5!      5#      5$      �� 5%   
   " ��6   .�5&      ��  � �� 5'      �� 5(      " ��6&   .R�5)      � .+�5*      �� $ 
Horizontal=�6)   
������ .+�5+   "   � $ SquareCheckBoxChecked��6'   .+�5,   &   �� $
 CheckedNormal��6,   $��Images\CheckedNormal.png��6C   $
��None=�6e   $��Center=�6t   �� 5-   &   $
 CheckedHover��6,   $��Images\CheckedHover.png��6B   $
��None=�6c   $��Center=�6r   $y�	Collapsed=�6�   5.   #   � 5/   "   $ SquareCheckBoxUnchecked��6'   $y�	Collapsed=�6H   .+�50   &   �� $
 UncheckedNormal��6,   $ ��Images\UncheckedNormal.png��6E   $
��None=�6i   $��Center=�6x   �� 51   &   $
 UncheckedHover��6,   $��Images\UncheckedHover.png��6D   $
��None=�6g   $��Center=�6v   $y�	Collapsed=�6�   52   #   �� 53   "   $ SquareCheckBoxText��6,   #��z��6H   $
	 Left=�6i   $��Center=�6   8��  $��15(�6�   $��9,0,0,0q�6�   54      55       56      P� 57       �@d�	IsChecked$ falseY�6;   . �58   "   �� $ SquareCheckBoxChecked��6Q    � y�$ 	Collapsed=�6?   6Q   �� 59   "   $ SquareCheckBoxUnchecked��6O    � y�$ Visible=�6?   6O   5:      P� 5;       �@J�IsMouseOver . . �5<   "   �� $ CheckedNormal��6Q    � y�$ 	Collapsed=�6?   6Q   �� 5=   "   $ UncheckedNormal��6Q    � y�$ 	Collapsed=�6?   6Q   �� 5>   "   $ CheckedHover��6O    � y�$ Visible=�6?   6O   �� 5?   "   $ UncheckedHover��6O    � y�$ Visible=�6?   6O   �� 5@   "   8  $ SquareCheckBoxText��6h    � ��5A      5C      5E      5F      5G      .��5I      � -   5        $��
layoutGrid��5I      $��
10,0,16,-1q�6    � ColumnDefinitions 5J   
   �� 5K      $
��345* �6   �� 5L      $
��373* �6    � RowDefinitions 5N   
   �� 5O      $
��Auto �6   �� 5P      $��* �6   �� 5Q      $
��Auto �6   �� 5R      $
��Auto �6   .+�5T   
   ]� $��0��6   $��38,49,45,531q�6!   $��2��67   $��2��6K   .+�5U      �� $
��Left=�6   $��Images\Logo.png��6*   $
��Fill=�6C   $��32��6R   $��81��6^   $��0 10 0 5q�6i   �� 5V      $��Right=�6   $��0,0,-1,0q�6/   $��Bottom=�6A   #��[  6\   $��Segoe UI)�6�   $��18(�6�   $��Depth Data Display��6�   �� 5W      $��Images\Status.png��6   $
��None=�6/   $��Center=�6>   $��0 0 0 5q�6[   $��Right=�6l   5X      (� 5Y   
   $��1��6    (� Stretch$ Uniform=�6   $��Center=�61   $��2��6N   $��
44,57,64,0q�6b   $	��610��6v   .��5Z      �� -   5        $��Image��5Z      $	��461��6!   $	��338��6-   5[      �� 5\   
   -   5        $��buttonScreenshot��5\   �   $��2��6   #��[ 6   $��
Screenshot��6F   $��32��6[   $��Right=�6g   $��Center=�6�   $��
0,10,11,10q�6�   $��1��6�   $	��114��6�   �� 5]   
   -   5        $��	statusBar��5]   ?   $��3��6   $��Stretch=�6!   $��Bottom=�6P   
�������#��[  6~   $��2��6�   $��26��6�   .@�5^      �� $��0 0 0 10q�6   $	��720��6/   .��5_      �� -   5        $��statusBarText��5_      $��-1 0 0 0q�61   JHPress 'Screenshot' to save a screenshot to your 'My Pictures' directory.6�   5`      5a      �� 5b   
   -   5         ��Name$ Record��5b      $��Record��6!   $��	196,8,0,0q�62   $��2��6E   $	��Top=�6R   $��16(�6j   $
��Bold"�6x    J� RenderTransformOrigin$ 0.5,0.5&�6�   $��Center=�6�   $��42��6�   $
��Left=�6�   $��84��6
  �� 5c   
   $��Subject Number��6   $
��Left=�6)   $��2��6D   $	��Top=�6Q   $��96��6i   $ -1.109,0.927&�6t   $
��Bold"�6�   $��26��6�   $��1��6�   �� 5d   
   -   5         ��Name$	 Sub��5d      $
��Left=�6   $��28��6:   $��	23,24,0,0q�6F   $��2��6Y    �� TextWrapping$
 Wrap=�6f   $	��999��6z   $	��Top=�6�   $��41��6�   $��1��6�   �� 5e   
   $��Leveling��6   $
��Left=�6#   $��28��6>   $��
113,0,0,24q�6J   $��2��6^   $��Bottom=�6k   $��64��6�   $
��Bold"�6�   �� 5f   
   -	   5        $ Degree��5f      $
��Left=�6"   $��23��6=   $��
117,26,0,0q�6I   $��2��6]   $
 Wrap=�6j   $��0��6~   $	��Top=�6�   $��55��6�   5g      5h      