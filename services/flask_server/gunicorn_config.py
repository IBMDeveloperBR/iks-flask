from os import environ
import multiprocessing


''' Gunicorn Configuration '''
bind = "0.0.0.0:" + str(int(environ.get("PORT", 5000)))
workers = multiprocessing.cpu_count()*2 + 1
threads = 2*multiprocessing.cpu_count()