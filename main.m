function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 27-Apr-2017 01:36:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
 ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
ll=imread('main.jpg');
image(ll);
colormap gray
set(ha,'handlevisibility','off','visible','off');
         
          axes(handles.axes1);
          Image=imread('11.jpg');
          hImage1=imshow(Image);
          
        axes(handles.axes2)
          s=imread('12.jpg')
            hImage2=imshow(s);
            axes(handles.axes3)
          s=imread('13.jpg')
            hImage3=imshow(s);
            axes(handles.axes4)
          s=imread('14.jpg')
            hImage4=imshow(s);
           
           % Display the image and get the image handle
         %hImage2=imshow(s); 
         set(hImage1,'ButtonDownFcn',@myCallback1); % Set the ButtonDown callback function of the image object to myCallback defined by myself
         set(hImage2,'ButtonDownFcn',@myCallback2);
         set(hImage3,'ButtonDownFcn',@myCallback3);
         set(hImage4,'ButtonDownFcn',@myCallback4);
      ;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(untitled2)

set(h,'visible','on');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(fulanghefei)

set(h,'visible','on');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(jiami)

set(h,'visible','on');
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
set(gcf,'visible','off');
h=figure(untitled2)



set(h,'visible','on');
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function myCallback1(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(untitled2)

set(h,'visible','on');
function myCallback2(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(fulanghefei)

set(h,'visible','on');
function myCallback3(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(jiami)

set(h,'visible','on');
function myCallback4(hObject, eventdata, handles)
set(gcf,'visible','off');

h=figure(kongjianlvbofangzhen)

set(h,'visible','on');
