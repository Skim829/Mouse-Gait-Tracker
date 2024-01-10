function varargout = Modif_peak(varargin)
% MODIF_PEAK MATLAB code for Modif_peak.fig
%      MODIF_PEAK, by itself, creates a new MODIF_PEAK or raises the existing
%      singleton*.
%
%      H = MODIF_PEAK returns the handle to a new MODIF_PEAK or the handle to
%      the existing singleton*.
%
%      MODIF_PEAK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODIF_PEAK.M with the given input arguments.
%
%      MODIF_PEAK('Property','Value',...) creates a new MODIF_PEAK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Modif_peak_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Modif_peak_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Modif_peak

% Last Modified by GUIDE v2.5 28-Apr-2021 19:07:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Modif_peak_OpeningFcn, ...
                   'gui_OutputFcn',  @Modif_peak_OutputFcn, ...
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


% --- Executes just before Modif_peak is made visible.
function Modif_peak_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Modif_peak (see VARARGIN)
% global C  locs_upper1 time
load ('Peaks');

plot(handles.axes1,time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');
% Choose default command line output for Modif_peak
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Modif_peak wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Modif_peak_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.
function edit1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton6.
function pushbutton6_ButtonDownFcn(hObject, eventdata, handles)
N = get(handles.edit1,'String')
N=str2num(N);
load ('Peaks');

if N==1
plot(handles.axes1,time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');
elseif N==2
    plot(handles.axes1,time,C(:,2),'-p','MarkerIndices',[locs_upper2],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LR');
elseif N==3
    plot(handles.axes1,time,C(:,3),'-p','MarkerIndices',[locs_upper3],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RF');
else
    plot(handles.axes1,time,C(:,4),'-p','MarkerIndices',[locs_upper4],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RR');
end
% save ('Peaks','C','locs_upper1', 'locs_upper2', 'locs_upper3', 'locs_upper4','time')
% assignin('base','im2',im2); %끝나고 저장할때 사용하자

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton4.
function pushbutton4_ButtonDownFcn(hObject, eventdata, handles)
%여기는 Detect
load ('Peaks');
N = get(handles.edit1,'String')
N=str2num(N);

if N==1
plot(handles.axes1,time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');
elseif N==2
    plot(handles.axes1,time,C(:,2),'-p','MarkerIndices',[locs_upper2],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LR');
elseif N==3
    plot(handles.axes1,time,C(:,3),'-p','MarkerIndices',[locs_upper3],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RF');
else
    plot(handles.axes1,time,C(:,4),'-p','MarkerIndices',[locs_upper4],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RR');
end
new_Peak=zeros(1,4);
 h= imrect;  
new_Peak=wait(h);   
%    new_Peak(1)*246+t
%    new_Peak(3)*246
[r t]=max(C(new_Peak(1)*246:new_Peak(1)*246+new_Peak(3)*246,N))

if N==1
    locs_upper1=sort(vertcat(locs_upper1,round(new_Peak(1)*246+t)));
    elseif N==2
     locs_upper2=sort(vertcat(locs_upper2,round(new_Peak(1)*246+t)));
     elseif N==3
     locs_upper3=sort(vertcat(locs_upper3,round(new_Peak(1)*246+t)));
     else
     locs_upper4=sort(vertcat(locs_upper4,round(new_Peak(1)*246+t)));
end

save ('Peaks','C','locs_upper1', 'locs_upper2', 'locs_upper3', 'locs_upper4','time')
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton5.
function pushbutton5_ButtonDownFcn(hObject, eventdata, handles)
%여기는 Delete
load ('Peaks');
N = get(handles.edit1,'String')
N=str2num(N);

if N==1
plot(handles.axes1,time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');
elseif N==2
    plot(handles.axes1,time,C(:,2),'-p','MarkerIndices',[locs_upper2],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LR');
elseif N==3
    plot(handles.axes1,time,C(:,3),'-p','MarkerIndices',[locs_upper3],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RF');
else
    plot(handles.axes1,time,C(:,4),'-p','MarkerIndices',[locs_upper4],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RR');
end
new_Peak=zeros(1,4);
 h= imrect;  
new_Peak=wait(h);   

[r t]=max(C(new_Peak(1)*246:new_Peak(1)*246+new_Peak(3)*246,N));


if N==1
     K=zeros(size(locs_upper1,1),1);
     K=round(new_Peak(1)*246)<locs_upper1&locs_upper1<round((new_Peak(1)+new_Peak(3))*246);
     locs_upper1(find(K))=[];
    elseif N==2
     K=zeros(size(locs_upper2,1),1);
     K=round(new_Peak(1)*246)<locs_upper2&locs_upper2<round((new_Peak(1)+new_Peak(3))*246);
     locs_upper2(find(K))=[];
     elseif N==3
     K=zeros(size(locs_upper3,1),1);
     K=round(new_Peak(1)*246)<locs_upper3&locs_upper3<round((new_Peak(1)+new_Peak(3))*246);
     locs_upper3(find(K))=[];
     else
     K=zeros(size(locs_upper4,1),1);
     K=round(new_Peak(1)*246)<locs_upper4&locs_upper4<round((new_Peak(1)+new_Peak(3))*246);
     locs_upper4(find(K))=[];
end

save ('Peaks','C','locs_upper1', 'locs_upper2', 'locs_upper3', 'locs_upper4','time')
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
