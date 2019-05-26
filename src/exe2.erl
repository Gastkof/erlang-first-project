%% @author Gaston and Shiraz
%% @doc @todo Add description to exe2.


-module(exe2).
-import(lists,[sort/1,map/2,foreach/2]). 
%% ====================================================================
%% API functions========================================
-export([start/0,sortm/1,power/2,smallest_bigest/1,tuplelist/2]).



%% ====================================================================
%% Internal functions
%% ====================================================================

%%this is a function that recived an unsorted list and then uses a build in funcation
%%to sort it from small to big
sortm(A)->
	%%make the sort 	
	L=sort(A),
	%%print the result 
	io:fwrite("~p~n",[L]).

%% this function recived an list and argument that will do
%% manipulation to the list k => kPWR
power(A,X)->
	%%manipulation on the list 
 	
	LI=[floor(math:pow(PO, X))||PO<-A],
	
	%%print the result 	
	io:fwrite("~w~n",[LI]).

smallest_bigest(A) when is_list(A)->
%% 		smallest_bigest(A),	
		K=[tuple_to_list(X)||X<-A,is_tuple(X)],
		MIN=lists:min(K),
		MAX=lists:max(K),
		LIST=lists:append(MIN,MAX),
%% 		MI = lists:min(tuple_to_list(LIST)),
		MI1=lists:min(LIST),
		M=lists:max(LIST),

		
		io:fwrite("{~p,~p}~n",[MI1,M]);

smallest_bigest(A) when is_tuple(A)->

		LI=tuple_to_list(A),
%% 		B=[tuple_to_list(X)||X<-LI,is_tuple(X)],
		tuplelist(LI, []).
	


%% helper function that will transfer the tuple to list and than will serach for MAX,MIN number
tuplelist([],B)-> smallest_bigest(B);
%% helper function that will transfer the tuple to list and than will serach for MAX,MIN number
tuplelist(A,B)->			
		[H|T]=A,
		if
			is_integer(H)-> 
								
						 tuplelist(T, B++integer_to_list(H));
						  
			is_tuple(H) -> 
							LI=tuple_to_list(H) ,
%% 				 K=[tuple_to_list(X) ||X<-LI,is_tuple(X)],
						
						 
					tuplelist(T, B++LI)		;			  	     
				  
			true->
				tuplelist(T, B++H)
 	
		end.

	

start()->
	
	A=[6,3,9,-1],
	sortm(A),

	power([1,2,3],3),
	smallest_bigest({1, 2, 3, {-10, 23, 6, {-1000, 9}}, {{100, 0, 10300}, -2}, -999, 10500, {0, 999}}),
	smallest_bigest({1, 2, 3, {-5, 23}, {{100, 0}, -2},{120}}).