function varargout = irregular(varargin)
% IRREGULAR MATLAB code for irregular.fig
%      IRREGULAR, by itself, creates a new IRREGULAR or raises the existing
%      singleton*.
%
%      H = IRREGULAR returns the handle to a new IRREGULAR or the handle to
%      the existing singleton*.
%
%      IRREGULAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IRREGULAR.M with the given input arguments.
%
%      IRREGULAR('Property','Value',...) creates a new IRREGULAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before irregular_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to irregular_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help irregular

% Last Modified by GUIDE v2.5 23-Dec-2016 01:00:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @irregular_OpeningFcn, ...
                   'gui_OutputFcn',  @irregular_OutputFcn, ...
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


% --- Executes just before irregular is made visible.
function irregular_OpeningFcn(hObject, eventdata, handles, varargin)
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
ll=imread('4.jpg');
image(ll);
colormap gray
set(ha,'handlevisibility','off','visible','off');
s=imread('5.bmp');
  %colormap gray
 axes(handles.axes7);
 imshow(s)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to irregular (see VARARGIN)

% Choose default command line output for irregular
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes irregular wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = irregular_OutputFcn(hObject, eventdata, handles) 
axes(handles.axes1);
imshow('xing.png');
axes(handles.axes6);
imshow('xin.png');
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
axes(handles.axes7);
hg=get(gca,'children');
delete(hg);
a=imread('1.bmp');
x=rgb2gray(a);
%figure
%grid on 
axes(handles.axes2);
imshow(x,[])
afft=fft2(x);
aabs=abs(afft);
aabss=fftshift(aabs);
axes(handles.axes3);
imshow(aabss,[]) 
colormap(gray);
colorbar 
axes(handles.axes4);
plot(aabss)
colormap(gray); 
axes(handles.axes5);
meshc(aabss)
maxx1=max(max(aabss));
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
axes(handles.axes7);
hg=get(gca,'children');
delete(hg);
a=imread('2.bmp');
x=rgb2gray(a);
%figure
%grid on 
axes(handles.axes2);
imshow(x,[])
afft=fft2(x);
aabs=abs(afft);
aabss=fftshift(aabs);
axes(handles.axes3);
imshow(aabss,[]) 
colormap(gray);
colorbar 
axes(handles.axes4);
plot(aabss)
colormap(gray); 
axes(handles.axes5);
meshc(aabss)
maxx1=max(max(aabss));
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(fulanghefei)

set(h,'visible','on');
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
