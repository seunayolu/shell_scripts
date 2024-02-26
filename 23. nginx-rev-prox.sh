server {
    listen      80;  # Change the port to 8080
    server_name rev-prox.np.io www.rev-prox.np.io;
    index       index.html;
    root        /var/www/apache.np.io;  # fallback for index.php
    
    location / {
        try_files $uri $uri/ /index.html?$query_string;
    }

    location /blog {
        proxy_pass http://apache.np.dev.darey.io:8080;
        proxy_http_version                 1.1;
        proxy_cache_bypass                 $http_upgrade;

        # Proxy headers
        proxy_set_header Upgrade           $http_upgrade;
        proxy_set_header Connection        "upgrade";
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Host  $host;
        proxy_set_header X-Forwarded-Port  $server_port;

        # Proxy timeouts
        proxy_connect_timeout              60s;
        proxy_send_timeout                 60s;
        proxy_read_timeout                 60s;
    }
}
