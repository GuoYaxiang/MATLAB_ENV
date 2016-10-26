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

% Last Modified by GUIDE v2.5 26-Oct-2016 17:09:54

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
global ImgTemp;  %全局变量，是匹配函数中的其中一个输入变量-----模板图像
[tempPic,tempPath,flag] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tiff';'*.pgm'},'选择模板图片');
if(flag ~= 0)
    ImgTemp = imread([tempPath,tempPic]);
    figure(1);
    imshow(ImgTemp);
else
    ImgTemp = 0;
end

% --- Executes on button press in ImgTarget.
function ImgTarget_Callback(hObject, eventdata, handles)
% hObject    handle to ImgTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImgTar;  %全局变量，是匹配函数中的其中一个输入变量-----待匹配图像
[tarPic,tarPath,flag] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tiff';'*.pgm'},'选择待匹配图片');
if(flag ~= 0)
    ImgTar = imread([tarPath,tarPic]);
    figure(1);
    imshow(ImgTar);
end

% --- Executes on button press in ImgSeries.
function ImgSeries_Callback(hObject, eventdata, handles)
% hObject    handle to ImgSeries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mydir;
mydir = uigetdir('','选择待匹配图片文件夹');
set(handles.Info,'String',mydir);

% --- Executes on button press in BaseFunc.
function BaseFunc_Callback(hObject, eventdata, handles)
% hObject    handle to BaseFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FuncName,FuncPath,flag] = uigetfile('*.m','选择使用的函数');
if(flag ~= 0)
%     addpath(genpath(FuncPath));
    addpath(FuncPath);
end
global BaseFunc;
BaseFunc = str2func(strrep(FuncName,'.m',''));
% functions(BaseFunc)
% path                          %%%测试路径添加操作是否成功
rmpath(FuncPath);             %%为了避免对其他工程造成影响，在实验结束后应该将函数路径全部移除


% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SaveTextEnable;
global SaveImageEnable;
global TrajectoryEnable;
global FrameModeEnable;    

global mydir;
global ImgTemp;
global ImgTar;
global BaseFunc;

if SaveTextEnable
    fid = fopen([datestr(now,30),'结果记录.txt'],'w+');
else
    fid = 0;
end

if ImgTar ~= 0
    if ImgTemp ~= 0
        [flagDone,rpos,cpos] = BaseFunc(ImgTar,ImgTemp);
    else
        [flagDone,rpos,cpos] = BaseFunc(ImgTar);
    end
    
    if flagDone == 1
        figure(1);title('结果显示');plot(cpos,rpos,'g*');
        runInfo = ['运行成功，结果点的行坐标为：',rpos,'列坐标为：',cpos];
        set(handles.Info,'String',runInfo);        
    end
elseif mydir ~= 0
    myfile = dir(mydir);
    startInd = 1;
    endInd = length(myfile); %%% 关于序列的起止可以更改，后续可以将更改的接口实现在界面上
    
    if TrajectoryEnable
        trace = zeros(endInd-startInd+1,2);
    end
    
    for i=startInd:endInd
        tar = imread([mydir,'/Frame （',num2str(i),'）.jpg']);
        if ImgTemp ~= 0
            [flagDone,rpos,cpos] = BaseFunc(tar,ImgTemp);
        else
            [flagDone,rpos,cpos] = BaseFunc(tar);
        end

        if flagDone == 1
            
            if TrajectoryEnable
                trace(i,:) = [rpos cpos];
                tar=bitmapplot(trace(:,1),trace(:,2),tar,struct('LineWidth',1,'Color',[1 0 0 1]));
            end
            
            figure(1);title('结果显示');
            imshow(tar);
            hold on
            plot(cpos,rpos,'g*');
            %%% 保存图片
            if SaveImageEnable
                saveName = ['result',num2str(i),'.jpg'];
                saveas(figure(1),saveName);
            end
            
            runInfo = ['运行成功，结果点的行坐标为：',rpos,'列坐标为：',cpos];
            
        else
            runInfo = '运行失败';
        end

        set(handles.Info,'String',runInfo);
        if SaveTextEnable
            fprintf(fid,'%s\r\n',runInfo);
            fprintf(fid,'%s\r\n',' ');
        end
        if FrameModeEnable
            pause;
        end
    end
end
if SaveTextEnable
    fclose(fid);
end
% --- Executes on button press in CloseAll.
function CloseAll_Callback(hObject, eventdata, handles)
% hObject    handle to CloseAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;
clc;
close();

% --- Executes on button press in SaveTextEnable.
function SaveTextEnable_Callback(hObject, eventdata, handles)
% hObject    handle to SaveTextEnable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveTextEnable
global SaveTextEnable; 
SaveTextEnable = get(hObject,'Value');
if SaveTextEnable
    set(handles.Info,'String','保存文本开启');
else
    set(handles.Info,'String','保存文本关闭');
end

% --- Executes on button press in TrajectoryEnable.
function TrajectoryEnable_Callback(hObject, eventdata, handles)
% hObject    handle to TrajectoryEnable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TrajectoryEnable; 

TrajectoryEnable = get(hObject,'Value');
if TrajectoryEnable
    set(handles.Info,'String','轨迹显示开启');
else
    set(handles.Info,'String','轨迹显示关闭');
end

% Hint: get(hObject,'Value') returns toggle state of TrajectoryEnable


% --- Executes on button press in SaveImageEnable.
function SaveImageEnable_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImageEnable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveImageEnable
global SaveImageEnable; 
SaveImageEnable = get(hObject,'Value');
if SaveImageEnable
    set(handles.Info,'String','保存图片开启');
else
    set(handles.Info,'String','保存图片关闭');
end


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
global FrameModeEnable; 
FrameModeEnable = get(hObject,'Value');
if FrameModeEnable
    set(handles.Info,'String','一帧一停开启');
else
    set(handles.Info,'String','一帧一停关闭');
end

