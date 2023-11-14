<h1>0x1A. Application server</h1>


<h2>Background Context</h2>
<p>Your web infrastructure is already serving web pages via Nginx that you installed in your first web stack project. While a web server can also serve dynamic content, this task is usually given to an application server. In this project you will add this piece to your infrastructure, plug it to your<b> Nginx </b>and make is serve your Airbnb clone project.</p>


<h2>Taskes</h2>

<h4>0. Set up development with Python</h4>
<p>   Let’s serve what you built for AirBnB clone v2 - Web framework on web-01. This task is an exercise in setting up your development environment, which is used for testing and debugging your code before deploying it to production.</p>

<h4>1. Set up production with Gunicorn</h4>
<p>   Now that you have your development environment set up, let’s get your production application server set up with Gunicorn on web-01, port 5000. You’ll need to install Gunicorn and any libraries required by your application. Your Flask application object will serve as a WSGI entry point into your application. This will be your production environment. As you can see we want the production and development of your application to use the same port, so the conditions for serving your dynamic content are the same in both environments</p>

<h4>2. Serve a page with Nginx</h4>
<p>   Building on your work in the previous tasks, configure Nginx to serve your page from the route /airbnb-onepage/</p>
   <a herf="2-app_server-nginx_config">   2-app_server-nginx_config</a>
