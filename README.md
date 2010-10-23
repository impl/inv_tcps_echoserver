inv_tcps Echoserver
===================

This is a sample project for [inv_tcps](http://github.com/invectorate/inv_tcps).

Compiling
---------

To build this example, execute `./rebar get-deps`, `./rebar compile`, and
`./rebar generate`. This should put a working release environment in
the `rel/echoserver` directory.

Running
-------

To run the example server, execute `./rel/echoserver/bin/echoserver console`.
You should get a shell; try running `application:which_applications/0` to make
sure the server is actually up. If it is, `telnet localhost 8080` and start
typing!
