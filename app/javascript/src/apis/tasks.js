import axios from "axios";

const fetch = () => axios.get("/api/v1/tasks");

// Here we need to pass the payload as task-> name of instance
const create = payload =>
  axios.post("/api/v1/tasks", {
    task: payload,
  });

const tasksApi = { fetch, create };

export default tasksApi;
