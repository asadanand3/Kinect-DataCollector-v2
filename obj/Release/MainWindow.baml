   M S B A M L   `   `   `  ����   DepthBasics-WPF5    /Microsoft.Samples.Kinect.DepthBasics.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     � Title$  Depth Basics��$	��735��$��752.09�� � 	Resources    MediumGreyBrush �� Color  KinectPurpleBrush  KinectBlueBrush �� 
TargetType �� Property �� Value  SnapshotButton �� 
TargetType �� Orientation ��Name	 �� TextAlignment
 ��Name �� Triggers P� Property P� Value �� 
TargetName  SquareCheckBox �Name��%�  &	        &	      &	 *     '�� ?     &	 t     7  7  &	 e    7  7  �� $ 	#ff6e6e6e���� $ 	#ff52318f���� $ 	#ff00BCF2���� " ��.���  �@J�SnapsToDevicePixels . �� " ��.���  � �� �� " ��.R�� .+��� $ 
Horizontal=�
������ .+��� $ SnapText��#��z��$
	 Left=�$��Center=�8��  $��15(�� $��9,0,0,0q�.+��� $
 
SnapNormal��$��Images\SnapNormal.png��$
��None=�$��Center=��� $
 	SnapHover��$��Images\SnapHover.png��$
��None=�$��Center=�$y�	Collapsed=� P�  �@J�IsMouseOver . . ��� $ 
SnapNormal�� � y�$ 	Collapsed=��� $ 	SnapHover�� � y�$ Visible=��� 8  $ SnapText�� � ���� " ��.���  � �� �� " ��.R�� .+��� $ 
Horizontal=�
������ .+�� $ SquareCheckBoxChecked��.+��� $
 CheckedNormal��$��Images\CheckedNormal.png��$
��None=�$��Center=��� $
 CheckedHover��$��Images\CheckedHover.png��$
��None=�$��Center=�$y�	Collapsed=�� $ SquareCheckBoxUnchecked��$y�	Collapsed=�.+��� $
 UncheckedNormal��$ ��Images\UncheckedNormal.png��$
��None=�$��Center=��� $
 UncheckedHover��$��Images\UncheckedHover.png��$
��None=�$��Center=�$y�	Collapsed=��� $ SquareCheckBoxText��#��z��$
	 Left=�$��Center=�8��  $��15(�$��9,0,0,0q� P�  �@d�	IsChecked$ falseY�. ��� $ SquareCheckBoxChecked�� � y�$ 	Collapsed=��� $ SquareCheckBoxUnchecked�� � y�$ Visible=�P�  �@J�IsMouseOver . . ��� $ CheckedNormal�� � y�$ 	Collapsed=��� $ UncheckedNormal�� � y�$ 	Collapsed=��� $ CheckedHover�� � y�$ Visible=��� $ UncheckedHover�� � y�$ Visible=��� 8  $ SquareCheckBoxText�� � ��.��� -   $��
layoutGrid��$��
10,0,16,-1q� � ColumnDefinitions �� $
��345* ��� $
��373* � � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto �.+�]� $��0��$��38,49,45,531q�$��2��$��2��.+��� $
��Left=�$��Images\Logo.png��$
��Fill=�$��32��$��81��$��0 10 0 5q��� $��Right=�$��0,0,-1,0q�$��Bottom=�#��[  $��Segoe UI)�$��18(�$��Depth Data Display���� $��Images\Status.png��$
��None=�$��Center=�$��0 0 0 5q�$��Right=�(� $��1�� (� Stretch$ Uniform=�$��2��$��
44,57,64,0q�$	��610��.���� -   $��Image��$	��461��$	��338���� 
���  ��$��Center=�$	��100��$��0,0,0,0q�$��2��$��Center=�$��5��$��2���� 
���  ��$��Center=�$��5��$��0,0,0,0q�$��2��$��Center=�$	��100��$��2���� -   $��buttonScreenshot��$��2��#��[ $��
Screenshot��$��32��$��Right=�$��Center=�$��
0,10,11,10q�$��1��$	��114���� -   $��	statusBar��$��3��$��Stretch=�$��Bottom=�
�������#��[  $��2��$��26��.@��� $��0 0 0 10q�$	��720��.���� -   $��statusBarText��$��-1 0 0 0q�JHPress 'Screenshot' to save a screenshot to your 'My Pictures' directory.�� -    ��Name$ Record��$��Record��$��	196,8,0,0q�$��2��$	��Top=�$��16(�$
��Bold"� J� RenderTransformOrigin$ 0.5,0.5&�$��Center=�$��42��$
��Left=�$��84���� $��Subject Number��$
��Left=�$��2��$	��Top=�$��96��$ -1.109,0.927&�$
��Bold"�$��26��$��1���� -    ��Name$	 Sub��$
��Left=�$��28��$��	23,24,0,0q�$��2�� �� TextWrapping$
 Wrap=�$	��999��$	��Top=�$��41��$��1���� $��Leveling��$
��Left=�$��28��$��
113,0,0,24q�$��2��$��Bottom=�$��64��$
��Bold"��� -	   $ Degree��$
��Left=�$��23��$��
117,26,0,0q�$��2��$
 Wrap=�$��0��$	��Top=�$��55��