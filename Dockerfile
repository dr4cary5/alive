FROM ubuntu:latest

# ۱. نصب ابزارهای مورد نیاز
RUN apt-get update && apt-get install -y \
    openssh-client \
    tmux \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ۲. دانلود و نصب ttyd
RUN curl -sLo /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

ENV PORT=10000
EXPOSE 10000

# ۳. اجرای ttyd با محیط تعاملی bash
CMD ["ttyd", "-p", "10000", "-c", "admin:mysecretpassword", "bash"]
