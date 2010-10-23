%% Copyright (c) 2010 Invectorate LLC. All rights reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(inv_tcps_echoserver).

%% API
-export([start_link/0]).

%% Callbacks
-export([accept/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    inv_tcps:start_link({local, ?MODULE},
                        [{port, 8080}, {callback, {?MODULE, accept}}]).

%% ===================================================================
%% Callbacks
%% ===================================================================

accept(Socket) ->
    case gen_tcp:recv(Socket, 0) of
        {ok, Packet} ->
            gen_tcp:send(Socket, Packet),
            accept(Socket);
        _Error ->
            ok
    end.
