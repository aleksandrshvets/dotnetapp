@"
apiVersion: v1
kind: Service
metadata:
  name: alex-app-service
spec:
  selector:
    app: alex-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: http
      name: http
"@ | kubectl apply -f -