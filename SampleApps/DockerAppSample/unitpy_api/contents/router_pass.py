#!/usr/bin/env python
# -*- coding: utf-8 -*-

## alive
def alive(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return [b"Unit for Wsgi is Up."]

## not_found
def not_found(environ, start_response):
    start_response('404 Not Found', [('Content-Type', 'text/html')])
    return [b"404 Not Found."]

def hellowaz(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    response = [b"Hellow Azure App."]
    return response

def hellowdocker(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    response = [b"Hellow Azure App on Docker."]
    return response

routes = [
    ('/','GET', alive),
    ('/hellowaz','GET', hellowaz),
    ('/hellowdocker','GET', hellowdocker),
    ('/dockerrun','GET', dockerrun)
]