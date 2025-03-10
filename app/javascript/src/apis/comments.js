import axios from "axios";

const create = payload => axios.post(`api/v1/comments`, payload);

const commentsApi = {
  create,
};

export default commentsApi;
