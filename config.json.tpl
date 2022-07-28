{
  "port": "3000",
  "adminAccount": "{{ YAPI_ADMIN_NAME }}",
  "db": {
    "connectString": "mongodb://{{ MONGODB_USER }}:{{ MONGODB_PASSWORD }}@{{ MONGODB_HOST }}:{{ MONGODB_PORT }}/{{ MONGODB_DATABASE }}?authenticationDatabase=admin"
  },
  "closeRegister": true
}
