include "lab4.inc"
include "lab4.con"
include "lab4_2.pro"
include "lab5_1.pro"
include "lab5_2.pro"

/***************************************************************************
	�������� � ��������� ������� ��� ���� Task Window
***************************************************************************/
	
predicates
 task_win_eh : EHANDLER	%���������� ������� ����
constants
 steps_cnt = 64
clauses
	% ����, ����, �������
	task_win_eh(_Win, e_Menu(id_lab_5_volk_koza_kapusta, _ShiftCtlAlt), 0):-
		test_dfs(X), % ����� ���������
	term_str(st_lst, X, S1),
	dlg_MessageBox(
			"����, ����, �������",
			S1, 
			mesbox_iconInformation, 
			mesbox_buttonsOK, 
			mesbox_defaultFirst, 
			mesbox_suspendApplication
		),!.
		
	% ��� �����
	task_win_eh(_Win ,e_Menu(id_lab_5_hod_konem, _ShiftCtlAlt), 0):-
	  	walk([3,3],Res,steps_cnt),
	term_str(il, Res, S1),
	term_str(integer, steps_cnt, S2),
	format(S, "���� = % \n���-�� ����� = % \n", S1, S2),
	dlg_MessageBox(
			"��� �����",
			S,
			mesbox_iconInformation, 
			mesbox_buttonsOK, 
			mesbox_defaultFirst, 
			mesbox_suspendApplication
		),!.
	
	% ��������-������
	task_win_eh(_Win, e_Menu(id_lab_4_tick_tack_toe, _ShiftCtlAlt), 0):-
		dlg_tick_tack_toe_Create(_Win), !. % ����� ���������

goal	%������� goal - �������� ����
	vpi_Init([wsf_TitleBar, wsf_Close,wsf_Maximize, wsf_Minimize, wsf_ClipSiblings],
  		task_win_eh, res_menu(idr_task_menu), "lab 4 and 5", "lab 4 and 5").

/**************************************************************************
	�������� � ��������� ������� ���� ��������-������
**************************************************************************/
predicates
  dlg_tick_tack_toe_eh : EHANDLER
  message(integer, WINDOW)
  go(WINDOW)
clauses
  dlg_tick_tack_toe_Create(Parent):-
	win_CreateResDialog(Parent, wd_Modal, idd_crosses, dlg_tick_tack_toe_eh, 0).

%������� ������� �� ������
  dlg_tick_tack_toe_eh(_Win, e_Control(idc_1, _CtrlType, _CtrlWin, _CtlInfo),0):- !,
    Han = win_GetCtlHandle(_Win, idc_1), %��������� �����������
    win_GetText(Han)="", win_SetText(Han,"X"), go(_Win), !. %���� ���� ��������, �� ��������� ���� � � �������� ��� ����������
	
  dlg_tick_tack_toe_eh(_Win, e_Control(idc_2, _CtrlType, _CtrlWin, _CtlInfo), 0):-!,
    Han = win_GetCtlHandle(_Win, idc_2),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win, e_Control(idc_3, _CtrlType,_CtrlWin,_CtlInfo), 0):-!,
    Han = win_GetCtlHandle(_Win, idc_3),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win, e_Control(idc_4, _CtrlType,_CtrlWin,_CtlInfo), 0):-!,
    Han = win_GetCtlHandle(_Win,idc_4),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win, e_Control(idc_5, _CtrlType, _CtrlWin, _CtlInfo), 0):-!,
    Han = win_GetCtlHandle(_Win, idc_5),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win, e_Control(idc_6, _CtrlType, _CtrlWin, _CtlInfo), 0):-!,
    Han = win_GetCtlHandle(_Win, idc_6),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win, e_Control(idc_7, _CtrlType, _CtrlWin, _CtlInfo), 0):-!,
    Han = win_GetCtlHandle(_Win, idc_7),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win,e_Control(idc_8,_CtrlType,_CtrlWin,_CtlInfo),0):-!,
    Han = win_GetCtlHandle(_Win, idc_8),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_Win,e_Control(idc_9,_CtrlType,_CtrlWin,_CtlInfo),0):-!,
    Han = win_GetCtlHandle(_Win, idc_9),
    win_GetText(Han) = "", win_SetText(Han, "X"), go(_Win), !.

  dlg_tick_tack_toe_eh(_, _, _):- !, fail.

  %��� ����������
  go(_Win):-
  %��������� ����������� ������ � �������
    Han1 = win_GetCtlHandle(_Win, idc_1), S1 = win_GetText(Han1),
    Han2 = win_GetCtlHandle(_Win, idc_2), S2 = win_GetText(Han2),
    Han3 = win_GetCtlHandle(_Win, idc_3), S3 = win_GetText(Han3),
    Han4 = win_GetCtlHandle(_Win, idc_4), S4 = win_GetText(Han4),
    Han5 = win_GetCtlHandle(_Win, idc_5), S5 = win_GetText(Han5),
    Han6 = win_GetCtlHandle(_Win, idc_6), S6 = win_GetText(Han6),
    Han7 = win_GetCtlHandle(_Win, idc_7), S7 = win_GetText(Han7),
    Han8 = win_GetCtlHandle(_Win, idc_8), S8 = win_GetText(Han8),
    Han9 = win_GetCtlHandle(_Win, idc_9), S9 = win_GetText(Han9),
    %����� ������ ���������
    makego(
    	S1, S2, S3, S4, S5, S6, S7, S8, S9, 
    	Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Res),
    win_SetText(Han1, Q1),	%��������� ����� ��������
    win_SetText(Han2, Q2),
    win_SetText(Han3, Q3),
    win_SetText(Han4, Q4),
    win_SetText(Han5, Q5),
    win_SetText(Han6, Q6),
    win_SetText(Han7, Q7),
    win_SetText(Han8, Q8),
    win_SetText(Han9, Q9),
    message(Res, _Win).
    
  message(Res,_Win):-
    Res=1, dlg_MessageBox("����� ����", "�� ��������", mesbox_iconInformation, 
    mesbox_buttonsOK, mesbox_defaultFirst, mesbox_suspendApplication),
    win_Destroy(_Win),!;
    
    Res=2, dlg_MessageBox("����� ����", "�� ���������", mesbox_iconInformation, 
    mesbox_buttonsOK, mesbox_defaultFirst, mesbox_suspendApplication),
    win_Destroy(_Win),!;
    
    Res=3, dlg_MessageBox("����� ����", "�����", mesbox_iconInformation, 
    mesbox_buttonsOK, mesbox_defaultFirst, mesbox_suspendApplication),
    win_Destroy(_Win),!;!.
    