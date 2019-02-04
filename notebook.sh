#!/bin/bash
echo "Opening in Colab..."
if [ -z "$1" ]
then
	python -m webbrowser "https://colab.research.google.com/github/gsidsid/ThinkStats2/"
else
	python -m webbrowser "https://colab.research.google.com/github/gsidsid/ThinkStats2/blob/master/$1"
fi
jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0 --no-browser

