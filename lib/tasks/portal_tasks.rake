namespace 'portal' do
  desc "compile and inject portal app into /public"
  task "inject" do
    sh "cd portal && ./node_modules/.bin/ember build -prod"
    FileUtils.cp_r('./portal/dist/assets/.', './public/assets')
    # FileUtils.cp_r('./portal/dist/fonts/.', './public/fonts')
    # FileUtils.cp_r('./portal/dist/translations/.', './public/translations')
    FileUtils.cp('./portal/dist/index.html', './public/')
    FileUtils.cp('./portal/dist/crossdomain.xml', './public/')
  end
end
