FROM ubuntu:latest

# ۱. نصب ابزارهای مورد نیاز
RUN apt-get update && apt-get install -y \
    openssh-client \
    tmux \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ۲. دانلود gotty
RUN curl -sL https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz | tar xz -C /usr/local/bin

EXPOSE 10000

# ۳. اجرای gotty بدون کانفیگ اضافی
CMD ["gotty", "-w", "-p", "10000", "-a", "0.0.0.0", "bash"]
