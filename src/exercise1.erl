%% @author Gaston and Shiraz
%% @doc @todo Add description to exercise1.


-module(exercise1).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,match/2,match2/2,match3/2]).


-record(person,{gender="",name}).
%% ====================================================================
%% Internal functions
%% ====================================================================
%% match(A,B)->
%% 	
%% 	if 
%% 		A#person.gender/=B#person.gender ;
%% 		false->	io:fwrite("~p and ~p Match ~n",[A#person.name,B#person.name]);
%% 		
%% 		true->
%% 		io:fwrite("~p and ~p  noMatch ~n",[A#person.name,B#person.name]);
%% 		
%% 	end.

%% check a case when  the gender is not match and they have the same name
match(X,Y) when Y#person.gender/=X#person.gender ,X#person.name=:=Y#person.name->
			io:fwrite("~p and ~p best Match ~n",[X#person.name,Y#person.name]);
%% check a case when  the gender is not match 

match(X,Y) when  Y#person.gender/=X#person.gender->				
			io:fwrite("~p and ~p Match ~n",[X#person.name,Y#person.name]);
		
%% check a case when  the gender is the same 

match(X,Y) when  Y#person.gender==X#person.gender->			
		io:fwrite("~p and ~p  noMatch ~n",[X#person.name,Y#person.name]).


%% working like a loop (while/for)
match2([],B)->[];		

match2([A|C],B) ->	
	[H|T]=B,
	[Q|_]=T,
	match(A,H),
	match(A,Q),
	match2(C,B);
	
match2(AL,BL) ->
	match2(AL,BL).


%% match3(ALL,BLL)->
%% 		[A|C]=ALL,
%% 		[B|D]=BLL,
%% 		[Z|_]=D,
%% 		[X|_]=C,
%% 		match(A,B),
%% 		match(A, Z),
%% 		match(X, B),
%% 		match(X, Z).
match3([],[])->[];		

match3([A|C],B) ->	
	[H|T]=B,
	[Q|_]=T,
	match(A,H),
	match(A,Q),
	match2(C,B);
	
match3(AL,BL) ->
	match3(AL,BL).		
	
start()->
	A=#person{gender="male",name=john},
	B=#person{gender="female",name =kate},
%% 	this for run the frist mathod
	match(A,B),
%% 	this for run the second mathod
	match2([#person{gender="male",name=john},#person{gender="female",name=kate},#person{gender="male",name=john1},#person{gender="female", name=kate1}],[#person{gender="male",name=mandy},#person{gender="female",name=ros}]),
%% 	this for run the 3th  mathod
	match3([#person{gender="male",name=ros},#person{gender="female", name=kate}],[#person{gender="male",name=mandy},#person{gender="female",name=ros}]).



