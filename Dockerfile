FROM ubuntu:latest

# ۱. نصب ابزارهای مورد نیاز
RUN apt-get update && apt-get install -y \
    openssh-client \
    tmux \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ۲. دانلود و نصب ttyd (وب‌ترمینال)
RUN curl -sLo /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

# ۳. تنظیم رمز عبور برای ورود به وب‌ترمینال (به جای admin و mysecretpassword اطلاعات دلخواه بگذارید)
ENV PORT=10000
EXPOSE 10000

# ۴. اجرای وب‌ترمینال و اتصال مستقیم آن به یک جلسه tmux
CMD ttyd -p 10000 -c admin:mysecretpassword tmux new-session -A -s main
