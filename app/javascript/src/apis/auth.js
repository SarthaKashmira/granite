import axios from "axios";

const login = payload =>
  axios.post("api/v1/session", {
    login: payload,
  });

const logout = () => axios.delete(`/session`);

const signup = payload =>
  axios.post("api/v1/users", {
    user: payload,
  });

const authApi = {
  login,
  signup,
  logout,
};

export default authApi;
