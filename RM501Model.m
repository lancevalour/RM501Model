function varargout = RM501Model(varargin)
% Coded by Yicheng(Lance) Zhang
% RM501MODEL MATLAB code for RM501Model.fig
%      RM501MODEL, by itself, creates a new RM501MODEL or raises the existing
%      singleton*.
%
%      H = RM501MODEL returns the handle to a new RM501MODEL or the handle to
%      the existing singleton*.
%
%      RM501MODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RM501MODEL.M with the given input arguments.
%
%      RM501MODEL('Property','Value',...) creates a new RM501MODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RM501Model_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RM501Model_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RM501Model

% Last Modified by GUIDE v2.5 07-Oct-2013 19:14:44

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @RM501Model_OpeningFcn, ...
                       'gui_OutputFcn',  @RM501Model_OutputFcn, ...
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


% --- Executes just before RM501Model is made visible.
function RM501Model_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RM501Model (see VARARGIN)

% Choose default command line output for RM501Model
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);
    warning('off','all');



% UIWAIT makes RM501Model wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RM501Model_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;




function originalTheta1Input_Callback(hObject, eventdata, handles)
% hObject    handle to originalTheta1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% % originaltheta1=get(hObject,'String');
% % originaltheta1=str2double(originaltheta1);

% Hints: get(hObject,'String') returns contents of originalTheta1Input as text
%        str2double(get(hObject,'String')) returns contents of originalTheta1Input as a double


% --- Executes during object creation, after setting all properties.
function originalTheta1Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalTheta1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in homePosition.
function homePosition_Callback(hObject, eventdata, handles)
% hObject    handle to homePosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    pushbuttonFlag=get(hObject,'value');
    global clickStartingButtonFlag;
    % 
    if pushbuttonFlag==1;
        clickStartingButtonFlag=1;
    else
        clickStartingButtonFlag=0;
    end

    originaltheta1=str2double(get(handles.originalTheta1Input,'String'));
    originalTheta1String=get(handles.originalTheta1Input,'String');
    emptyOriginalTheta1Flag=isempty(originalTheta1String);
    if originaltheta1<-150||originaltheta1>150||emptyOriginalTheta1Flag
        errordlg('Please input a valid starting theta1','Input Error');
        validtheta1Flag=0;
    else
        validtheta1Flag=1;
    end

    originaltheta2=str2double(get(handles.originalTheta2Input,'String'));
    originalTheta2String=get(handles.originalTheta2Input,'String');
    emptyOriginalTheta2Flag=isempty(originalTheta2String);
    if originaltheta2<-100||originaltheta2>30||emptyOriginalTheta2Flag
        errordlg('Please input a valid starting theta2','Input Error');
        validtheta2Flag=0;
    else
        validtheta2Flag=1;
    end

    originaltheta3=str2double(get(handles.originalTheta3Input,'String'));
    originalTheta3String=get(handles.originalTheta3Input,'String');
    emptyOriginalTheta3Flag=isempty(originalTheta3String);
    if originaltheta3<0||originaltheta3>90||emptyOriginalTheta3Flag
        errordlg('Please input a valid starting theta3','Input Error');
        validtheta3Flag=0;
    else
        validtheta3Flag=1;
    end

    originaltheta4=str2double(get(handles.originalTheta4Input,'String'));
    originalTheta4String=get(handles.originalTheta4Input,'String');
    emptyOriginalTheta4Flag=isempty(originalTheta4String);
    if originaltheta4<0||originaltheta4>180||emptyOriginalTheta4Flag
        errordlg('Please input a valid starting theta4','Input Error');
        validtheta4Flag=0;
    else
        validtheta4Flag=1;
    end

    originaltheta5=str2double(get(handles.originalTheta5Input,'String'));
    originalTheta5String=get(handles.originalTheta5Input,'String');
    emptyOriginalTheta5Flag=isempty(originalTheta5String);
    if originaltheta5<-180||originaltheta5>180||emptyOriginalTheta5Flag
        errordlg('Please input a valid starting theta5','Input Error');
        validtheta5Flag=0;
    else
        validtheta5Flag=1;
    end

    % originaltheta1=originaltheta1*3.1415926/180;
    % originaltheta2=originaltheta2*3.1415926/180;
    % originaltheta3=originaltheta3*3.1415926/180;
    % originaltheta4=originaltheta4*3.1415926/180;
    % originaltheta5=originaltheta5*3.1415926/180;

    if pushbuttonFlag==1 && validtheta1Flag==1 && validtheta2Flag==1 && validtheta3Flag==1 && validtheta4Flag==1 && validtheta5Flag==1 
    %originalTheta1Input_Callback(hObject,eventdata,handles);
    % originaltheta2=0;
     %originaltheta3=0;
    % originaltheta4=0;
    % originaltheta5=0;
        moveLink(originaltheta1,originaltheta2,originaltheta3,originaltheta4,originaltheta5);
    end


function originalTheta2Input_Callback(hObject, eventdata, handles)
% hObject    handle to originalTheta2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalTheta2Input as text
%        str2double(get(hObject,'String')) returns contents of originalTheta2Input as a double


% --- Executes during object creation, after setting all properties.
function originalTheta2Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalTheta2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function originalTheta3Input_Callback(hObject, eventdata, handles)
% hObject    handle to originalTheta3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalTheta3Input as text
%        str2double(get(hObject,'String')) returns contents of originalTheta3Input as a double


% --- Executes during object creation, after setting all properties.
function originalTheta3Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalTheta3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function originalTheta4Input_Callback(hObject, eventdata, handles)
% hObject    handle to originalTheta4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalTheta4Input as text
%        str2double(get(hObject,'String')) returns contents of originalTheta4Input as a double


% --- Executes during object creation, after setting all properties.
function originalTheta4Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalTheta4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function originalTheta5Input_Callback(hObject, eventdata, handles)
% hObject    handle to originalTheta5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of originalTheta5Input as text
%        str2double(get(hObject,'String')) returns contents of originalTheta5Input as a double


% --- Executes during object creation, after setting all properties.
function originalTheta5Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to originalTheta5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function destTheta1Input_Callback(hObject, eventdata, handles)
% hObject    handle to destTheta1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of destTheta1Input as text
%        str2double(get(hObject,'String')) returns contents of destTheta1Input as a double


% --- Executes during object creation, after setting all properties.
function destTheta1Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to destTheta1Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function destTheta2Input_Callback(hObject, eventdata, handles)
% hObject    handle to destTheta2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of destTheta2Input as text
%        str2double(get(hObject,'String')) returns contents of destTheta2Input as a double


% --- Executes during object creation, after setting all properties.
function destTheta2Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to destTheta2Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function destTheta3Input_Callback(hObject, eventdata, handles)
% hObject    handle to destTheta3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of destTheta3Input as text
%        str2double(get(hObject,'String')) returns contents of destTheta3Input as a double


% --- Executes during object creation, after setting all properties.
function destTheta3Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to destTheta3Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function destTheta4Input_Callback(hObject, eventdata, handles)
% hObject    handle to destTheta4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of destTheta4Input as text
%        str2double(get(hObject,'String')) returns contents of destTheta4Input as a double


% --- Executes during object creation, after setting all properties.
function destTheta4Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to destTheta4Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function destTheta5Input_Callback(hObject, eventdata, handles)
% hObject    handle to destTheta5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of destTheta5Input as text
%        str2double(get(hObject,'String')) returns contents of destTheta5Input as a double


% --- Executes during object creation, after setting all properties.
function destTheta5Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to destTheta5Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in destPosition.
function destPosition_Callback(hObject, eventdata, handles)
% hObject    handle to destPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%moveLink(originaltheta1,originaltheta2,originaltheta3,originaltheta4,originaltheta5);

    desttheta1=str2double(get(handles.destTheta1Input,'String'));
    desttheta1String=get(handles.destTheta1Input,'String');
    emptyDesttheta1Flag=isempty(desttheta1String);
    if desttheta1<-150||desttheta1>150||emptyDesttheta1Flag
        errordlg('Please input a valid destination theta1','Input Error');
        validtheta1Flag1=0;
    else
        validtheta1Flag1=1;
    end

    desttheta2=str2double(get(handles.destTheta2Input,'String'));
    desttheta2String=get(handles.destTheta2Input,'String');
    emptyDesttheta2Flag=isempty(desttheta2String);
    if desttheta2<-100||desttheta2>30||emptyDesttheta2Flag
        errordlg('Please input a valid destination theta2','Input Error');
        validtheta2Flag1=0;
    else
        validtheta2Flag1=1;
    end

    desttheta3=str2double(get(handles.destTheta3Input,'String'));
    desttheta3String=get(handles.destTheta3Input,'String');
    emptyDesttheta3Flag=isempty(desttheta3String);
    if desttheta3<0||desttheta3>90||emptyDesttheta3Flag
        errordlg('Please input a valid destination theta3','Input Error');
        validtheta3Flag1=0;
    else
        validtheta3Flag1=1;
    end

    desttheta4=str2double(get(handles.destTheta4Input,'String'));
    desttheta4String=get(handles.destTheta4Input,'String');
    emptyDesttheta4Flag=isempty(desttheta4String);
    if desttheta4<0||desttheta4>180||emptyDesttheta4Flag
        errordlg('Please input a valid destination theta4','Input Error');
        validtheta4Flag1=0;
    else
        validtheta4Flag1=1;
    end

    desttheta5=str2double(get(handles.destTheta5Input,'String'));
    desttheta5String=get(handles.destTheta5Input,'String');
    emptyDesttheta5Flag=isempty(desttheta5String);
    if desttheta5<-180||desttheta5>180||emptyDesttheta5Flag
        errordlg('Please input a valid destination theta5','Input Error');
        validtheta5Flag1=0;
    else
        validtheta5Flag1=1;
    end
    % originaltheta1=desttheta1;
    % originaltheta2=desttheta2;
    % originaltheta3=desttheta3;
    % originaltheta4=desttheta4;
    % originaltheta5=desttheta5;
    % desttheta1=desttheta1*3.1415926/180;
    % desttheta2=desttheta2*3.1415926/180;
    % desttheta3=desttheta3*3.1415926/180;
    % desttheta4=desttheta4*3.1415926/180;
    % desttheta5=desttheta5*3.1415926/180;

    originaltheta1=str2double(get(handles.originalTheta1Input,'String'));
    originaltheta2=str2double(get(handles.originalTheta2Input,'String'));
    originaltheta3=str2double(get(handles.originalTheta3Input,'String'));
    originaltheta4=str2double(get(handles.originalTheta4Input,'String'));
    originaltheta5=str2double(get(handles.originalTheta5Input,'String'));

    % originaltheta1=originaltheta1*3.1415926/180;
    % originaltheta2=originaltheta2*3.1415926/180;
    % originaltheta3=originaltheta3*3.1415926/180;
    % originaltheta4=originaltheta4*3.1415926/180;
    % originaltheta5=originaltheta5*3.1415926/180;


    %Set the movement speed of the joints
    stepspeed=str2double(get(handles.setSpeed,'String'));
    stepspeedString=get(handles.setSpeed,'String');
    emptySpeedFlag=isempty(stepspeedString);
    if stepspeed<=0||stepspeed>10||emptySpeedFlag
        errordlg('Please input a valid speed','Input Error');
        validspeedFlag=0;
    else
        validspeedFlag=1;
    end
    if validspeedFlag==1
        stepspeed=stepspeed/3;
    end

    %Move the joints to the destination angle in the order of
    %shoulder-elbow-wristpitch-wristRow-waist 

    %Move shoulder joint
    pushbuttonFlag1=get(hObject,'value');
    global clickStartingButtonFlag;
    if validspeedFlag==1
        if clickStartingButtonFlag==1
            if pushbuttonFlag1==1 && validtheta1Flag1==1 && validtheta2Flag1==1 && validtheta3Flag1==1 && validtheta4Flag1==1 && validtheta5Flag1==1

                originaltheta1=str2double(get(handles.originalTheta1Input,'String'));
                originaltheta2=str2double(get(handles.originalTheta2Input,'String'));
                originaltheta3=str2double(get(handles.originalTheta3Input,'String'));
                originaltheta4=str2double(get(handles.originalTheta4Input,'String'));
                originaltheta5=str2double(get(handles.originalTheta5Input,'String'));
                ConMove(originaltheta1,originaltheta2,originaltheta3,originaltheta4,originaltheta5,desttheta1,desttheta2,desttheta3,desttheta4,desttheta5);

                if stepspeed~=0
                    set(handles.originalTheta1Input,'String',desttheta1);
                    set(handles.originalTheta2Input,'String',desttheta2);
                    set(handles.originalTheta3Input,'String',desttheta3);
                    set(handles.originalTheta4Input,'String',desttheta4);
                    set(handles.originalTheta5Input,'String',desttheta5);
                end
            end
            else
                 errordlg('Please click the "Starting Position" button','Input Error');
        end
    end
% --- Executes during object creation, after setting all properties.
function plotPosition_CreateFcn(hObject, eventdata, handles)

% hObject    handle to plotPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% % originaltheta1=0;
% % originaltheta2=0;
% % originaltheta3=0;
% % originaltheta4=0;
% % originaltheta5=0;

% Hint: place code in OpeningFcn to populate plotPosition



% % % function originalTheta3Input_Callback(hObject, eventdata, handles)
% % % % hObject    handle to originalTheta3Input (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    structure with handles and user data (see GUIDATA)
% % % 
% % % % Hints: get(hObject,'String') returns contents of originalTheta3Input as text
% % % %        str2double(get(hObject,'String')) returns contents of originalTheta3Input as a double
% % % 
% % % 
% % % % --- Executes during object creation, after setting all properties.
% % % function originalTheta3Input_CreateFcn(hObject, eventdata, handles)
% % % % hObject    handle to originalTheta3Input (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    empty - handles not created until after all CreateFcns called
% % % 
% % % % Hint: edit controls usually have a white background on Windows.
% % % %       See ISPC and COMPUTER.
% % % if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
% % %     set(hObject,'BackgroundColor','white');
% % % end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function setSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to setSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setSpeed as text
%        str2double(get(hObject,'String')) returns contents of setSpeed as a double


% --- Executes during object creation, after setting all properties.
function setSpeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global StoringPosition;
    StoringPosition=[];
    global clickStartingButtonFlag;
    clickStartingButtonFlag=0;
    handles.DataStorage=StoringPosition;
    guidata(hObject,handles);
     s =num2str(handles.DataStorage, '%.3f %.3f\n');
        set(handles.listbox3, 'String',s);
        clear;
    close (1,2,3);
    clearvars -global;
    close all;


% --- Executes on button press in nestPosition.
function nestPosition_Callback(hObject, eventdata, handles)
% hObject    handle to nestPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    desttheta1=-150;
    desttheta2=-100;
    desttheta3=90;
    desttheta4=180;
    desttheta5=0;
    % desttheta1=desttheta1*3.1415926/180;
    % desttheta2=desttheta2*3.1415926/180;
    % desttheta3=desttheta3*3.1415926/180;
    % desttheta4=desttheta4*3.1415926/180;
    % desttheta5=desttheta5*3.1415926/180;

    originaltheta1=str2double(get(handles.originalTheta1Input,'String'));
    originaltheta2=str2double(get(handles.originalTheta2Input,'String'));
    originaltheta3=str2double(get(handles.originalTheta3Input,'String'));
    originaltheta4=str2double(get(handles.originalTheta4Input,'String'));
    originaltheta5=str2double(get(handles.originalTheta5Input,'String'));

    % originaltheta1=originaltheta1*3.1415926/180;
    % originaltheta2=originaltheta2*3.1415926/180;
    % originaltheta3=originaltheta3*3.1415926/180;
    % originaltheta4=originaltheta4*3.1415926/180;
    % originaltheta5=originaltheta5*3.1415926/180;


    %Set the movement speed of the joints
    stepspeed=str2double(get(handles.setSpeed,'String'));
    stepspeedString=get(handles.setSpeed,'String');
    emptySpeedFlag=isempty(stepspeedString);
    if stepspeed<=0||stepspeed>10||emptySpeedFlag
        errordlg('Please input a valid speed','Input Error');
        validspeedFlag=0;
    else
        validspeedFlag=1;
    end
    if validspeedFlag==1
        stepspeed=stepspeed/3;
    end
    
    %Move the joints to the destination angle in the order of
    %shoulder-elbow-wristpitch-wristRow-waist 

    %Move shoulder joint
    pushbuttonFlag1=get(hObject,'value');
    global clickStartingButtonFlag;
    if validspeedFlag==1;
        if clickStartingButtonFlag==1
            theta2= originaltheta2;
            if desttheta2-originaltheta2>=0
                theta2step=stepspeed;
            else
                theta2step=-stepspeed;
            end

            for theta2=theta2:theta2step:desttheta2
                theta1=originaltheta1;
                theta3=originaltheta3;    
                theta4=originaltheta4;
                theta5=originaltheta5;
                moveLink(theta1,theta2,theta3,theta4,theta5);
            end

            %Move elbow joint
            theta3= originaltheta3;
            if desttheta3-originaltheta3>=0
                theta3step=stepspeed;
            else
                theta3step=-stepspeed;
            end

            for theta3=theta3:theta3step:desttheta3
                theta1=originaltheta1;
                theta2=desttheta2;
                theta4=originaltheta4;
                theta5=originaltheta5;
                moveLink(theta1,theta2,theta3,theta4,theta5);
            end

            %Move wristpitch joint
            theta4= originaltheta4;
            if desttheta4-originaltheta4>=0
                theta4step=stepspeed;
            else
                theta4step=-stepspeed;
            end

            for theta4=theta4:theta4step:desttheta4
                theta1=originaltheta1;
                theta2=desttheta2;
                theta3=desttheta3;
                theta5=originaltheta5;
                moveLink(theta1,theta2,theta3,theta4,theta5);
            end

            %Move wristrow joint
            theta5= originaltheta5;
            if desttheta5-originaltheta5>=0
                theta5step=stepspeed;
            else
                theta5step=-stepspeed;
            end

            for theta5=theta5:theta5step:desttheta5  
                theta1=originaltheta1;
                theta2=desttheta2;
                theta3=desttheta3;
                theta4=desttheta4;
                moveLink(theta1,theta2,theta3,theta4,theta5);
            end

            %Move waist joint
            theta1= originaltheta1;
            if desttheta1-originaltheta1>=0
                theta1step=stepspeed;
            else
                theta1step=-stepspeed;
            end

            for theta1=theta1:theta1step:desttheta1
                theta2=desttheta2;
                theta3=desttheta3;
                theta4=desttheta4;
                theta5=desttheta5;
                moveLink(theta1,theta2,theta3,theta4,theta5);
            end

            % desttheta1=desttheta1/3.1415926*180;
            % desttheta2=desttheta2/3.1415926*180;
            % desttheta3=desttheta3/3.1415926*180;
            % desttheta4=desttheta4/3.1415926*180;
            % desttheta5=desttheta5/3.1415926*180;

            if stepspeed~=0
                set(handles.originalTheta1Input,'String',desttheta1);
                set(handles.originalTheta2Input,'String',desttheta2);
                set(handles.originalTheta3Input,'String',desttheta3);
                set(handles.originalTheta4Input,'String',desttheta4);
                set(handles.originalTheta5Input,'String',desttheta5);
            end
            % originaltheta2=str2double(set(handles.originalTheta2Input,'String'));
            % originaltheta3=str2double(set(handles.originalTheta3Input,'String'));
            % originaltheta4=str2double(set(handles.originalTheta4Input,'String'));
            % originaltheta5=str2double(set(handles.originalTheta5Input,'String'));
        else
            errordlg('Please click the "Starting Position" button','Input Error');
        end
    end
    
% --- Executes on button press in StoringPosition.
function StoringPosition_Callback(hObject, eventdata, handles)
% hObject    handle to StoringPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% % % StoringPushButtonFlag=get(hObject,'value');
% % % numofClick=0;
% % % if StoringPushButtonFlag==1
% % %  numofClick=numofClick+1;
% % % end
% % % 
% % % if numofClick==1
% % % StoringPosition=[];
% % % end
    global StoringPosition;

    desttheta1=str2double(get(handles.destTheta1Input,'String'));
    desttheta1String=get(handles.destTheta1Input,'String');
    emptyDesttheta1Flag=isempty(desttheta1String);
    if desttheta1<-150||desttheta1>150||emptyDesttheta1Flag
        errordlg('Please input a valid destination theta1','Input Error');
        validtheta1Flag1=0;
    else
        validtheta1Flag1=1;
    end

    desttheta2=str2double(get(handles.destTheta2Input,'String'));
    desttheta2String=get(handles.destTheta2Input,'String');
    emptyDesttheta2Flag=isempty(desttheta2String);
    if desttheta2<-100||desttheta2>30||emptyDesttheta2Flag
        errordlg('Please input a valid destination theta2','Input Error');
        validtheta2Flag1=0;
    else
        validtheta2Flag1=1;
    end

    desttheta3=str2double(get(handles.destTheta3Input,'String'));
    desttheta3String=get(handles.destTheta3Input,'String');
    emptyDesttheta3Flag=isempty(desttheta3String);
    if desttheta3<0||desttheta3>90||emptyDesttheta3Flag
        errordlg('Please input a valid destination theta3','Input Error');
        validtheta3Flag1=0;
    else
        validtheta3Flag1=1;
    end

    desttheta4=str2double(get(handles.destTheta4Input,'String'));
    desttheta4String=get(handles.destTheta4Input,'String');
    emptyDesttheta4Flag=isempty(desttheta4String);
    if desttheta4<0||desttheta4>180||emptyDesttheta4Flag
        errordlg('Please input a valid destination theta4','Input Error');
        validtheta4Flag1=0;
    else
        validtheta4Flag1=1;
    end

    desttheta5=str2double(get(handles.destTheta5Input,'String'));
    desttheta5String=get(handles.destTheta5Input,'String');
    emptyDesttheta5Flag=isempty(desttheta5String);
    if desttheta5<-180||desttheta5>180||emptyDesttheta5Flag
        errordlg('Please input a valid destination theta5','Input Error');
        validtheta5Flag1=0;
    else
        validtheta5Flag1=1;
    end
    if validtheta1Flag1==1 && validtheta2Flag1==1 && validtheta3Flag1==1 && validtheta4Flag1==1 && validtheta5Flag1==1
        StoringPosition=[StoringPosition;str2double(get(handles.destTheta1Input,'String'))]; 
        StoringPosition=[StoringPosition;str2double(get(handles.destTheta2Input,'String'))]; 
        StoringPosition=[StoringPosition;str2double(get(handles.destTheta3Input,'String'))]; 
        StoringPosition=[StoringPosition;str2double(get(handles.destTheta4Input,'String'))]; 
        StoringPosition=[StoringPosition;str2double(get(handles.destTheta5Input,'String'))]; 

        handles.DataStorage=StoringPosition;
        guidata(hObject,handles);

        s=num2str(handles.DataStorage, '%.3f %.3f\n');
        set(handles.listbox3, 'String',s)

    end
% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearStorage.
function clearStorage_Callback(hObject, eventdata, handles)
% hObject    handle to clearStorage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global StoringPosition;
    StoringPosition=[];

    handles.DataStorage=StoringPosition;
    guidata(hObject,handles);
    s=num2str(handles.DataStorage, '%.3f %.3f\n');
    set(handles.listbox3, 'String',s)


% --- Executes on button press in sequentMove.
function sequentMove_Callback(hObject, eventdata, handles)
    % hObject    handle to sequentMove (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global StoringPosition;

    global clickStartingButtonFlag;
    if clickStartingButtonFlag~=1
        errordlg('Please click the "Starting Position" button','Input Error');
    else
        numofAllTheta=size(StoringPosition);
        numofSequence=numofAllTheta/5;

        for i=1:5:numofSequence*5
            originaltheta1=str2double(get(handles.originalTheta1Input,'String'));
            originaltheta2=str2double(get(handles.originalTheta2Input,'String'));
            originaltheta3=str2double(get(handles.originalTheta3Input,'String'));
            originaltheta4=str2double(get(handles.originalTheta4Input,'String'));
            originaltheta5=str2double(get(handles.originalTheta5Input,'String'));

            % originaltheta1=originaltheta1*3.1415926/180;
            % originaltheta2=originaltheta2*3.1415926/180;
            % originaltheta3=originaltheta3*3.1415926/180;
            % originaltheta4=originaltheta4*3.1415926/180;
            % originaltheta5=originaltheta5*3.1415926/180;


            %Set the movement speed of the joints
            stepspeed=str2double(get(handles.setSpeed,'String'));
            stepspeedString=get(handles.setSpeed,'String');
            emptySpeedFlag=isempty(stepspeedString);
            if stepspeed<=0||stepspeed>10||emptySpeedFlag
                errordlg('Please input a valid speed','Input Error');
                validspeedFlag=0;
            else
                validspeedFlag=1;
            end
            if validspeedFlag==1
                stepspeed=stepspeed/3;
            end

            if validspeedFlag==1
                desttheta1=StoringPosition(i);
                desttheta2=StoringPosition(i+1);
                desttheta3=StoringPosition(i+2);
                desttheta4=StoringPosition(i+3);
                desttheta5=StoringPosition(i+4);


                theta2= originaltheta2;
                if desttheta2-originaltheta2>=0
                    theta2step=stepspeed;
                else
                    theta2step=-stepspeed;
                end

                for theta2=theta2:theta2step:desttheta2
                    theta1=originaltheta1;
                    theta3=originaltheta3;    
                    theta4=originaltheta4;
                    theta5=originaltheta5;
                    moveLink(theta1,theta2,theta3,theta4,theta5);
                end

                %Move elbow joint
                theta3= originaltheta3;
                if desttheta3-originaltheta3>=0
                    theta3step=stepspeed;
                else
                    theta3step=-stepspeed;
                end

                for theta3=theta3:theta3step:desttheta3
                    theta1=originaltheta1;
                    theta2=desttheta2;
                    theta4=originaltheta4;
                    theta5=originaltheta5;
                    moveLink(theta1,theta2,theta3,theta4,theta5);
                end

                %Move wristpitch joint
                theta4= originaltheta4;
                if desttheta4-originaltheta4>=0
                    theta4step=stepspeed;
                else
                    theta4step=-stepspeed;
                end

                for theta4=theta4:theta4step:desttheta4
                    theta1=originaltheta1;
                    theta2=desttheta2;
                    theta3=desttheta3;
                    theta5=originaltheta5;
                    moveLink(theta1,theta2,theta3,theta4,theta5);
                end

                %Move wristrow joint
                theta5= originaltheta5;
                if desttheta5-originaltheta5>=0
                    theta5step=stepspeed;
                else
                    theta5step=-stepspeed;
                end

                for theta5=theta5:theta5step:desttheta5  
                    theta1=originaltheta1;
                    theta2=desttheta2;
                    theta3=desttheta3;
                    theta4=desttheta4;
                    moveLink(theta1,theta2,theta3,theta4,theta5);
                end

                %Move waist joint
                theta1= originaltheta1;
                if desttheta1-originaltheta1>=0
                    theta1step=stepspeed;
                else
                    theta1step=-stepspeed;
                end

                for theta1=theta1:theta1step:desttheta1
                    theta2=desttheta2;
                    theta3=desttheta3;
                    theta4=desttheta4;
                    theta5=desttheta5;
                    moveLink(theta1,theta2,theta3,theta4,theta5);
                end

                % desttheta1=desttheta1/3.1415926*180;
                % desttheta2=desttheta2/3.1415926*180;
                % desttheta3=desttheta3/3.1415926*180;
                % desttheta4=desttheta4/3.1415926*180;
                % desttheta5=desttheta5/3.1415926*180;

                if stepspeed~=0
                    set(handles.originalTheta1Input,'String',desttheta1);
                    set(handles.originalTheta2Input,'String',desttheta2);
                    set(handles.originalTheta3Input,'String',desttheta3);
                    set(handles.originalTheta4Input,'String',desttheta4);
                    set(handles.originalTheta5Input,'String',desttheta5);
                end
            end
        end
    end
 
    
% --- Executes on button press in Project2.
function Project2_Callback(hObject, eventdata, handles)
% hObject    handle to Project2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    thetao1=str2double(get(handles.originalTheta1Input,'String'));
    thetao2=str2double(get(handles.originalTheta2Input,'String'));
    thetao3=str2double(get(handles.originalTheta3Input,'String'));
    thetao4=str2double(get(handles.originalTheta4Input,'String'));
    thetao5=str2double(get(handles.originalTheta5Input,'String'));
    ConMove(thetao1,thetao2,thetao3,thetao4,thetao5,-150,-100,90,180,0);
    pause(2);
    ConMove(-150,-100,90,180,0,0,0,0,90,0);
    set(handles.originalTheta1Input,'String','0');
    set(handles.originalTheta2Input,'String','0');
    set(handles.originalTheta3Input,'String','0');
    set(handles.originalTheta4Input,'String','90');
    set(handles.originalTheta5Input,'String','0');
    
    
function[]=ConMove(thetao1,thetao2,thetao3,thetao4,thetao5,theta1,theta2,theta3,theta4,theta5)
    thetatem=zeros(1,5);
    thetaf=zeros(1,5);
    thetatem(1)=thetao1;
    thetatem(2)=thetao2;
    thetatem(3)=thetao3;
    thetatem(4)=thetao4;
    thetatem(5)=thetao5;
    thetaf(1)=theta1;
    thetaf(2)=theta2;
    thetaf(3)=theta3;
    thetaf(4)=theta4;
    thetaf(5)=theta5;
    
    while 1
        flag=0;
        for i=1:1:5
            if ((thetatem(i)-thetaf(i)>0.01)||(thetaf(i)-thetatem(i)>0.01)) 
                thetatem(i)=thetatem(i)-abs(thetatem(i)-thetaf(i))/(thetatem(i)-thetaf(i));
                flag=1;
            end
        end
        if (flag==0) break; end;
        moveLink(thetatem(1),thetatem(2),thetatem(3),thetatem(4),thetatem(5));
    end
