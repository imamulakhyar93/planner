const project = {
  namespaced: true,
  state() {
    return { selected: null };
  },
  mutations: {
    setSelected(state, projectId) {
      state.selected = projectId;
    },
  },
  actions: {
    setSelected(ctx, projectId) {
      ctx.commit("setSelected", projectId);
    },
  },
};

export default project;
