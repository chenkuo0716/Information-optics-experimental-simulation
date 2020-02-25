function varargout = kongjianlvbofangzhen(varargin)
% KONGJIANLVBOFANGZHEN MATLAB code for kongjianlvbofangzhen.fig
%      KONGJIANLVBOFANGZHEN, by itself, creates a new KONGJIANLVBOFANGZHEN or raises the existing
%      singleton*.
%
%      H = KONGJIANLVBOFANGZHEN returns the handle to a new KONGJIANLVBOFANGZHEN or the handle to
%      the existing singleton*.
%
%      KONGJIANLVBOFANGZHEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KONGJIANLVBOFANGZHEN.M with the given input arguments.
%
%      KONGJIANLVBOFANGZHEN('Property','Value',...) creates a new KONGJIANLVBOFANGZHEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kongjianlvbofangzhen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kongjianlvbofangzhen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kongjianlvbofangzhen

% Last Modified by GUIDE v2.5 09-Apr-2017 15:36:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kongjianlvbofangzhen_OpeningFcn, ...
                   'gui_OutputFcn',  @kongjianlvbofangzhen_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before kongjianlvbofangzhen is made visible.
function kongjianlvbofangzhen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kongjianlvbofangzhen (see VARARGIN)

% Choose default command line output for kongjianlvbofangzhen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kongjianlvbofangzhen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kongjianlvbofangzhen_OutputFcn(hObject, eventdata, handles) 
 ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
ll=imread('lvbo.jpg');
image(ll)
colormap gray
set(ha,'handlevisibility','off','visible','off');


% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    global  Image;
    [filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.bmp;*.gif','All Image Files';...
'*.*','All Files' });
Image= imread([pathname,filename]);
%Image=rgb2gray(Image);
axes(handles.axes1);
imshow(Image);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
  global  RImage; 
  figure(3)
   imshow(RImage);
  
    print(3,'-djpeg','C:\Users\Administrator\Desktop\三小实验\主界面\保存的结果图像')
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
   global  Image;
     global  RImage;
     
     scale=str2num(get(handles.edit1,'String'));
    popup_sel_index =get(handles.popupmenu1,'Value'); % Get current filter type
  
 %D=str2num(get(handles.edit2,'String'));

  %Image = imread('D:\10_5.bmp');
switch popup_sel_index
 case 1
     


     
     
PQ = paddedsize(size(Image));
[U,V]=dftuv(PQ(1),PQ(2)); 
D0 = scale*PQ(2);
F=fft2(Image,PQ(1),PQ(2)); % Fourier transform
g=abs(fftshift(F));  
axes(handles.axes6);
imshow(0.00001*g);





%scale=0.1;

H = lpfilter('gaussian', PQ(1),PQ(2),D0);

    %H=exp(-(D.^2)./(2*((D0)^2))); 
H1 = ifftshift(H);
RImage = dftfilt(Image,H);
RImage = im2uint8(mat2gray(RImage));
axes(handles.axes3);
imshow(RImage);
axes(handles.axes2);
imshow(H1);
P = paddedsize(size(H1));
D1= scale*P(2);
FF=fft2(H1,P(1),P(2)); % Fourier transform
gg=abs(fftshift(F));  
axes(handles.axes7);
imshow(0.00001*gg);


      case 2

PQ = paddedsize(size(Image));
[U,V]=dftuv(PQ(1),PQ(2)); 
D0 = scale*PQ(2);
F=fft2(Image,PQ(1),PQ(2)); % Fourier transform
g=abs(fftshift(F));  
axes(handles.axes6);
imshow(0.00001*g);



H = hpfilter('gaussian', PQ(1),PQ(2),D0);
H1 = ifftshift(H);
RImage = dftfilt(Image,H);
RImage = im2uint8(mat2gray(RImage));
axes(handles.axes3);
imshow(RImage);
axes(handles.axes2);
imshow(H1);
P = paddedsize(size(H1));
D1= scale*P(2);
FF=fft2(H1,P(1),P(2)); % Fourier transform
gg=abs(fftshift(F));  
axes(handles.axes7);
imshow(0.00001*gg);


          end
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



 function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
    
    sliderValue = get(handles.slider1,'Value');

set(handles.edit1,'String', num2str(sliderValue));

% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(main)

set(h,'visible','on');
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes7_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
