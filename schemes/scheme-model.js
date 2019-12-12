const db = require("../data/db-config.js");

module.exports = {
    allSchemes,
    findById,
    add,
    findSteps,
    update,
    remove
};


function allSchemes() {
    return db("schemes");
}

function findById(id) {
    return db("schemes")
            .where({ id })
            .first();
    
}

function findSteps(id) {
    return db("schemes as sc")
        .select("sc.scheme_name", "st.step_number", "st.instructions")
        .join("steps as st", "st.scheme_id"," sc.id")
        .orderBy("st.step_number")
        .where("sc.id", id)
       
}

function add(scheme) {
    return db("schemes")
        .insert(scheme, "id")
        .then(ids => {
            const [id] = ids;

            return findById(id);
        });
}

function update(id, changes) {
    return db('schemes')
      .where({id})
      .update(changes)
  

  }
  
  function remove(id) {
    return db('schemes')
      .where('id', id)
      .del();
  }