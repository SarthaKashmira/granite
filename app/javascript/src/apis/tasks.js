import axios from "axios";

const fetch = () => axios.get("/api/v1/tasks");

// Here we need to pass the payload as task-> name of instance
const show = slug => axios.get(`/api/v1/tasks/${slug}`);

const update = ({ slug, payload }) =>
  axios.put(`/api/v1/tasks/${slug}`, {
    task: payload,
  });

const create = payload =>
  axios.post("/api/v1/tasks", {
    task: payload,
  });

const destroy = slug => axios.delete(`api/v1/tasks/${slug}`);

const tasksApi = { fetch, create, show, update, destroy };

export default tasksApi;
