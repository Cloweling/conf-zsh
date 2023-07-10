# View branch
gbll() {
  git branch \
    --all \
    --color="always" \
    --sort=authordate \
    --format="%(color:green)%(authordate:relative);%(color:red)%(authorname);%(color:white)%(color:bold)%(refname:short)" \
    "$@" \
    | column -s ";" -t
}