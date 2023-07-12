function varargout = form(varargin)
% FORM MATLAB code for form.fig
%      FORM, by itself, creates a new FORM or raises the existing
%      singleton*.
%
%      H = FORM returns the handle to a new FORM or the handle to
%      the existing singleton*.
%
%      FORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM.M with the given input arguments.
%
%      FORM('Property','Value',...) creates a new FORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form

% Last Modified by GUIDE v2.5 17-Jun-2021 09:51:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form_OpeningFcn, ...
                   'gui_OutputFcn',  @form_OutputFcn, ...
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


% --- Executes just before form is made visible.
function form_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form (see VARARGIN)

% Choose default command line output for form
handles.output = hObject;
% uiwait(handles.figure1);
handles.tgroup = uitabgroup('Parent', handles.figure1,'TabLocation', 'top');
handles.tab1 = uitab('Parent', handles.tgroup, 'Title', 'Text');
handles.tab2 = uitab('Parent', handles.tgroup, 'Title', 'Image');
%Place panels into each tab
set(handles.plText,'Parent',handles.tab1)
set(handles.plImg,'Parent',handles.tab2)
%Reposition each panel to same location as panel 1
set(handles.plImg,'position',get(handles.plText,'position'));

handles.ImgOut='';
handles.dlNhung='';
handles.t=1;
handles.n=0;
handles.m=0;  
handles.ImgIn='';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form wait for user response (see UIRESUME)

% --- Outputs from this function are returned to the command line.
function varargout = form_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%*
% --- Executes on button press in ImgIn.
function ImgIn_Callback(hObject, eventdata, handles)%ch?n ?nh ??u vào
% hObject    handle to ImgIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tenAnh, duongDanAnh] = uigetfile( ...
                       {'*.jpg;*.png;*.bmp;*.jpeg;*.tif', 'All MATLAB Files (*.jpg, *.png, *.bmp, *.jpeg, *.tif)'; ...
                       '*.*', 'All Files (*.*)'}, ...
                       'Chon Anh Goc');

full = strcat(duongDanAnh, tenAnh);
handles.ImgIn = imread(full);
handles.FileTrich=imread(full);
imshow(handles.ImgIn,'Parent',handles.ImgInput);
guidata(hObject,handles);
%*
% --- Executes on button press in btndlNhung.
function btndlNhung_Callback(hObject, eventdata, handles)
% hObject    handle to btndlNhung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)     

[filename, pathname] = uigetfile({'*.txt'},'Chon Van Ban');
fullpath=strcat(pathname,filename);
text=fileread(fullpath);
set(handles.dlNhungtxt,'string',text);
txt=get(handles.dlNhungtxt,'string');
handles.dlNhung=str2bin(txt);
guidata(hObject,handles);        
        



% --- Executes during object creation, after setting all properties.
function dlNhungtxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dlNhungtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnNhung.
function btnNhung_Callback(hObject, eventdata, handles)
% hObject    handle to btnNhung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
t=get(handles.inputT,'string');
if t~=""
    handles.t=str2num(t);
end

[handles.ImgOut,sizedl,knn]=t2(handles.t,handles.dlNhung,handles.ImgIn,handles.n,handles.m);
set(handles.txtSizedl,'string',sizedl);
set(handles.txtKNN,'string',knn);
    if sizedl>knn
        warndlg('Nguong T khong phu hop, vuot qua kha nang nhung','Warning');
        ME = MException('MyComponent:noSuchVariable', ...
        'Nguong T khong phu hop, vuot qua kha nang nhung');
        throw(ME)
    end
imshow(handles.ImgOut,'Parent',handles.ImgOutput);
guidata(hObject,handles);

%*
function inputT_Callback(hObject, eventdata, handles)
% hObject    handle to inputT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputT as text
%        str2double(get(hObject,'String')) returns contents of inputT as a double
t=get(handles.inputT,'string');
if t~=""
    handles.t=str2num(t);
end
c=timTphuhop(handles.ImgIn,handles.t);
set(handles.txtKNN,'string',c);

% --- Executes during object creation, after setting all properties.
function inputT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%=============================Phan Image===================================
% --- Executes on button press in btndlNhung2.
function btndlNhung2_Callback(hObject, eventdata, handles)
% hObject    handle to btndlNhung2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tenAnh, duongDanAnh] = uigetfile( ...
                        {'*.jpg;*.png;*.bmp;*.jpeg;*.tif', 'All MATLAB Files (*.jpg, *.png, *.bmp, *.jpeg, *.tif)'; ...
                        '*.*', 'All Files (*.*)'}, ...
                        'Chon Anh Nhung');           
full = strcat(duongDanAnh, tenAnh);
hinhAnh = imread(full);
imshow(hinhAnh,'Parent',handles.dlNhungImg);
[n,m]=size(hinhAnh);
handles.n=n;
handles.m=m;
handles.dlNhung='';
    for i=1:n
        for j=1:m
            handles.dlNhung=strcat(handles.dlNhung,int2str(hinhAnh(i,j)));
        end
	end
guidata(hObject,handles);


function inputT2_Callback(hObject, eventdata, handles)
% hObject    handle to inputT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputT2 as text
%        str2double(get(hObject,'String')) returns contents of inputT2 as a double
t=get(handles.inputT2,'string');
if t~=""
    handles.t=str2num(t);
end
c=timTphuhop(handles.ImgIn,handles.t);
set(handles.txtKNN2,'string',c);

% --- Executes during object creation, after setting all properties.
function inputT2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnNhung2.
function btnNhung2_Callback(hObject, eventdata, handles)
% hObject    handle to btnNhung2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=get(handles.inputT2,'string');
if t~=""
    handles.t=str2num(t);
end
[handles.ImgOut,sizedl,knn]=t2(handles.t,handles.dlNhung,handles.ImgIn,handles.n,handles.m);
set(handles.txtSizedl2,'string',sizedl);
set(handles.txtKNN2,'string',knn);
    if sizedl>knn
        warndlg('Nguong T khong phu hop, vuot qua kha nang nhung','Warning');
        ME = MException('MyComponent:noSuchVariable', ...
        'Nguong T khong phu hop, vuot qua kha nang nhung');
        throw(ME)
    end
imshow(handles.ImgOut,'Parent',handles.ImgOutput2);
guidata(hObject,handles);

% --- Executes on button press in ImgIn2.
function ImgIn2_Callback(hObject, eventdata, handles)
% hObject    handle to ImgIn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tenAnh, duongDanAnh] = uigetfile( ...
                       {'*.jpg;*.png;*.bmp;*.jpeg;*.tif', 'All MATLAB Files (*.jpg, *.png, *.bmp, *.jpeg, *.tif)'; ...
                       '*.*', 'All Files (*.*)'}, ...
                       'Chon Anh Goc');

full = strcat(duongDanAnh, tenAnh);
handles.ImgIn = imread(full);
handles.FileTrich=imread(full);
imshow(handles.ImgIn,'Parent',handles.ImgInput2);
guidata(hObject,handles);
