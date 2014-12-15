#Auto Generate

This module creates or updates parts of JS files with given content.

#Synopsis

If you are writing code generators, you can use this module to inject your auto created code into source code safely.

#Install

npm install auto-generate;

#Usage

Consdering that you want to include JS code like below:

```
var Project = sequelize.define('Project', {
    title: Sequelize.STRING,
    description: Sequelize.TEXT
});
```

You can include it using:

```
var autogen = require('auto-generate');
// content is your content to include in the generated/updated file.
autogen(path.join(__dirname, 'model', 'account.js'), 'Project Model', content);
```

This updates or if not exists creates 'model/account.js' file with your content. Your content would wrapped with block
start and block end markers for further updates. The block shown below:

```
//!-AGS----------------------- Auto Start: Project Model------------------------
// Do NOT edit text between auto start and auto end. It is auto generated.

var Project = sequelize.define('Project', {
    title: Sequelize.STRING,
    description: Sequelize.TEXT
});

// 253792a6b07b0bbaa72526687b374cba You can edit safely after auto end.
//!-AGE------------------------ Auto End: Project Model ------------------------
```

Other parts of the auto generated file may be edited by hand. Next time you want to update the part, this module
finds the part and checks if inside of the part is changed, then updates the part according to given options.


#Index

**Modules**

* [auto-generate](#module_auto-generate)
  * [module.exports(filePath, name, content, options) ⏏](#exp_module_auto-generate)

**Typedefs**

* [type: genOptions](#genOptions)
 
<a name="module_auto-generate"></a>
#auto-generate
**Author**: Özüm Eldoğan  
<a name="exp_module_auto-generate"></a>
##module.exports(filePath, name, content, options) ⏏
Writes given content as an auto generated part to file considering options.

**Params**

- filePath `string` - File which content is written into  
- name `string` - Name of the part. This is used for differentiating it from other auto generated content.  
- content `string` - Content to write  
- options <code>[genOptions](#genOptions)</code> - Options how part is generated.  

**Example**  
var autogen = require('auto-generate');
var content = 'var someCode = "Joe";' // etc. auto generated code
autogen(path.join(__dirname, 'model', 'account.js'), 'model', content);

<a name="genOptions"></a>
#type: genOptions
Options used to create auto generated part.

**Properties**

- overWrite `boolean` - If file already exists. Update the file.  
- overWriteEvenChanged `boolean` - Overwrite generated part even it is modified manually.  
- backup `boolean` - Create backup if a file is overwritten.  
- ignoreWhitespaceChange `boolean` - Assume it is unmodified if whitespace is modified when calculating digest.  
- ignoreCommentChange `boolean` - Assume it is unmodified if comment is changed when calculating digest. This also enables ignoreWhitespaceChange too.  
- atStart `boolean` - Add text at the end of file. Otherwise it adds at the end. Either way replaces original text in place.  

**Type**: `Object`  
