from waitress import serve
from dj_static import Cling
from mysite.wsgi import application
app = Cling(application)
serve(app, host="0.0.0.0", port=8080)