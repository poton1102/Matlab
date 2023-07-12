function varargout = formTrich(varargin)
% FORMTRICH MATLAB code for formTrich.fig
%      FORMTRICH, by itself, creates a new FORMTRICH or raises the existing
%      singleton*.
%
%      H = FORMTRICH returns the handle to a new FORMTRICH or the handle to
%      the existing singleton*.
%
%      FORMTRICH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMTRICH.M with the given input arguments.
%
%      FORMTRICH('Property','Value',...) creates a new FORMTRICH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before formTrich_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to formTrich_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help formTrich

% Last Modified by GUIDE v2.5 16-Jun-2021 22:57:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @formTrich_OpeningFcn, ...
                   'gui_OutputFcn',  @formTrich_OutputFcn, ...
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


% --- Executes just before formTrich is made visible.
function formTrich_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to formTrich (see VARARGIN)

% Choose default command line output for formTrich
handles.output = hObject;
%multi tab
handles.tgroup = uitabgroup('Parent', handles.figure1,'TabLocation', 'top');
handles.tab1 = uitab('Parent', handles.tgroup, 'Title', 'Text');
handles.tab2 = uitab('Parent', handles.tgroup, 'Title', 'Image');
%Place panels into each tab
set(handles.plText,'Parent',handles.tab1)
set(handles.plImg,'Parent',handles.tab2)
%Reposition each panel to same location as panel 1
set(handles.plImg,'position',get(handles.plText,'position'));
% Update handles structure

handles.FileTrich='';
handles.ttPhu='';
guidata(hObject, handles);

% UIWAIT makes formTrich wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = formTrich_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtTrich_Callback(hObject, eventdata, handles)
% hObject    handle to txtTrich (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTrich as text
%        str2double(get(hObject,'String')) returns contents of txtTrich as a double


% --- Executes during object creation, after setting all properties.
function txtTrich_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTrich (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnTrich.
function btnTrich_Callback(hObject, eventdata, handles)
% hObject    handle to btnTrich (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dlTrich=t2_trich(handles.FileTrich,handles.ttPhu,0);
set(handles.txtTrich,'string',dlTrich);
guidata(hObject,handles);

% --- Executes on button press in btnTTPhu.
function btnTTPhu_Callback(hObject, eventdata, handles)
% hObject    handle to btnTTPhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt'},'Chon file thông tin ph?');
set(handles.txtTTPhu,'string',filename);
handles.ttPhu=filename;
guidata(hObject,handles);


function txtTTPhu_Callback(hObject, eventdata, handles)
% hObject    handle to txtTTPhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTTPhu as text
%        str2double(get(hObject,'String')) returns contents of txtTTPhu as a double


% --- Executes during object creation, after setting all properties.
function txtTTPhu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTTPhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnImgTrich.
function btnImgTrich_Callback(hObject, eventdata, handles)
% hObject    handle to btnImgTrich (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tenAnh, duongDanAnh] = uigetfile( ...
                       {'*.jpg;*.png;*.bmp;*.jpeg;*.tif', 'All MATLAB Files (*.jpg, *.png, *.bmp, *.jpeg, *.tif)'; ...
                       '*.*', 'All Files (*.*)'}, ...
                       'Chon Anh Goc');

full = strcat(duongDanAnh, tenAnh);
handles.FileTrich=imread(full);
imshow(handles.FileTrich,'Parent',handles.ImgInput);
guidata(hObject,handles);


% --- Executes on button press in btnTrich2.
function btnTrich2_Callback(hObject, eventdata, handles)
% hObject    handle to btnTrich2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dlTrich=t2_trich(handles.FileTrich,handles.ttPhu,1);
imshow(dlTrich,'Parent',handles.ImgTrich);

% --- Executes on button press in btnTTPhu2.
function btnTTPhu2_Callback(hObject, eventdata, handles)
% hObject    handle to btnTTPhu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt'},'Chon file thông tin ph?');
set(handles.txtTTPhu2,'string',filename);
handles.ttPhu=filename;
guidata(hObject,handles);


function txtTTPhu2_Callback(hObject, eventdata, handles)
% hObject    handle to txtTTPhu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTTPhu2 as text
%        str2double(get(hObject,'String')) returns contents of txtTTPhu2 as a double


% --- Executes during object creation, after setting all properties.
function txtTTPhu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTTPhu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnImgTrich2.
function btnImgTrich2_Callback(hObject, eventdata, handles)
% hObject    handle to btnImgTrich2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tenAnh, duongDanAnh] = uigetfile( ...
                       {'*.jpg;*.png;*.bmp;*.jpeg;*.tif', 'All MATLAB Files (*.jpg, *.png, *.bmp, *.jpeg, *.tif)'; ...
                       '*.*', 'All Files (*.*)'}, ...
                       'Chon Anh Goc');

full = strcat(duongDanAnh, tenAnh);
handles.FileTrich=imread(full);
imshow(handles.FileTrich,'Parent',handles.ImgInput2);
guidata(hObject,handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
