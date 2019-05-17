export default {
  MERGE_RECORDS: (state, { records, module, attr }) => {
    state[module][attr] = {
      ...state[module][attr],
      ...records
    }
  }
}
