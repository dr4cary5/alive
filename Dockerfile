FROM ubuntu:latest

# نصب ابزار python3 برای ساخت یک وب‌سرور ساده جهت پاس کردن Port Check
RUN apt-get update && apt-get install -y python3 openssh-client tmux

# ساخت یک سرویس وب ساختگی روی پورت 10000 و زنده نگه داشتن سیستم
CMD python3 -m http.server 10000 & sleep infinity
