# 使用官方JDK21基础镜像（请确认镜像名称是否准确，官方镜像可能暂未更新到21，可能需要调整）
FROM openjdk:21

# 设置工作目录（可选）
WORKDIR /app

# 将宿主机的jar包复制到镜像中（假设你的jar包名为tradingwin.jar）
COPY ./target/trading-win*.jar /app/trading-win-app.jar

# 声明日志挂载点
VOLUME /app/logs

# 运行jar包（如果应用有自定义日志路径参数需在此添加，例如：-Dlogging.file.path=/logs）
CMD ["java", "-jar", "trading-win-app.jar"]

