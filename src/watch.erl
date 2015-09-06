-module(watch).
-export([start/1]).

start(Port) ->

  {ok,_}=dets:open_file(watch_dets,[{file,"../db/watch.dets"},{type,bag},{auto_save,10}]),

  watch_item:start(),
  watch_user:start(),
  watch_relate:start(),
  watch_waiter:start(Port),
  watch_mesg:start(),
  watch_stat:start().
