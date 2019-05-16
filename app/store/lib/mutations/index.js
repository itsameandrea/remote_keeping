export default {
  MERGE_RECORDS: (state, { records, module, attr }) => {
    console.log('Records: ', records)
    console.log('Module: ', module)
    console.log('Attr: ', attr)
    state[module][attr] = {
      ...state[module][attr],
      ...records
    }
  }
}
