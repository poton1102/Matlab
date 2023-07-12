function varargout = gioithieu(varargin)
% GIOITHIEU MATLAB code for gioithieu.fig
%      GIOITHIEU, by itself, creates a new GIOITHIEU or raises the existing
%      singleton*.
%
%      H = GIOITHIEU returns the handle to a new GIOITHIEU or the handle to
%      the existing singleton*.
%
%      GIOITHIEU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GIOITHIEU.M with the given input arguments.
%
%      GIOITHIEU('Property','Value',...) creates a new GIOITHIEU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gioithieu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gioithieu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gioithieu

% Last Modified by GUIDE v2.5 21-Jul-2021 09:44:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gioithieu_OpeningFcn, ...
                   'gui_OutputFcn',  @gioithieu_OutputFcn, ...
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


% --- Executes just before gioithieu is made visible.
function gioithieu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gioithieu (see VARARGIN)

% Choose default command line output for gioithieu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gioithieu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gioithieu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnStart.
function btnStart_Callback(hObject, eventdata, handles)
% hObject    handle to btnStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
form

% --- Executes on button press in btnTrich.
function btnTrich_Callback(hObject, eventdata, handles)
% hObject    handle to btnTrich (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
formTrich
