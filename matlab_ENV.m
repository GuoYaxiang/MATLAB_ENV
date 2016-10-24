function varargout = matlab_ENV(varargin)
% MATLAB_ENV MATLAB code for matlab_ENV.fig
%      MATLAB_ENV, by itself, creates a new MATLAB_ENV or raises the existing
%      singleton*.
%
%      H = MATLAB_ENV returns the handle to a new MATLAB_ENV or the handle to
%      the existing singleton*.
%
%      MATLAB_ENV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_ENV.M with the given input arguments.
%
%      MATLAB_ENV('Property','Value',...) creates a new MATLAB_ENV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matlab_ENV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matlab_ENV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matlab_ENV

% Last Modified by GUIDE v2.5 24-Oct-2016 22:31:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matlab_ENV_OpeningFcn, ...
                   'gui_OutputFcn',  @matlab_ENV_OutputFcn, ...
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


% --- Executes just before matlab_ENV is made visible.
function matlab_ENV_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matlab_ENV (see VARARGIN)

% Choose default command line output for matlab_ENV
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matlab_ENV wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = matlab_ENV_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ImgTemplate.
function ImgTemplate_Callback(hObject, eventdata, handles)
% hObject    handle to ImgTemplate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ImgTarget.
function ImgTarget_Callback(hObject, eventdata, handles)
% hObject    handle to ImgTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ImgSeries.
function ImgSeries_Callback(hObject, eventdata, handles)
% hObject    handle to ImgSeries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in CloseAll.
function CloseAll_Callback(hObject, eventdata, handles)
% hObject    handle to CloseAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SaveTextEnable.
function SaveTextEnable_Callback(hObject, eventdata, handles)
% hObject    handle to SaveTextEnable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveTextEnable


% --- Executes on button press in TrajectoryEnable.
function TrajectoryEnable_Callback(hObject, eventdata, handles)
% hObject    handle to TrajectoryEnable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TrajectoryEnable


% --- Executes on button press in SaveImageEnable.
function SaveImageEnable_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImageEnable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveImageEnable



function Info_Callback(hObject, eventdata, handles)
% hObject    handle to Info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Info as text
%        str2double(get(hObject,'String')) returns contents of Info as a double


% --- Executes during object creation, after setting all properties.
function Info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FrameMode.
function FrameMode_Callback(hObject, eventdata, handles)
% hObject    handle to FrameMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FrameMode
