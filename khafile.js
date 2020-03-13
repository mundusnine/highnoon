let project = new Project('New Project');
project.addAssets('Assets/**');
project.addShaders('Shaders/**');
project.addSources('Sources');
project.addLibrary('Libraries/zui');
project.addProject('Libraries/hxShowdown');
resolve(project);
