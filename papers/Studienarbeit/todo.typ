//Copied from @preview/big-todo:0.2.0 and modified to work without a figure (thus no outlining is possible)
//Function to insert TODO
#let todo(body) = {
     block(fill: red)[! #body !]
  }
}