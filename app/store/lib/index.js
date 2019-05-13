const loadRelationships = (dispatch, record, schema) => {
  schema.relationships.forEach((rel) => {
    if (record.relationships[rel.name]) {
      dispatch(rel.action, { id: record.relationships[rel.name].data.id }, { root: true })
    }
  })
}

export { loadRelationships }