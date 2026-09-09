FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openssh-client \
    tmux \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sLo /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

EXPOSE 10000

# اضافه شدن پرچم -w برای فعال‌سازی کیبورد و تایپ
CMD ["ttyd", "-w", "-p", "10000", "-c", "admin:mysecretpassword", "bash"]
