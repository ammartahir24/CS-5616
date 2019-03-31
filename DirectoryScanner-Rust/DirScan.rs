// Name: Ammar Tahir

extern crate regex;
use regex::Regex;
use std::path::Path;
use std::fs;
use std::env;

fn main(){
	let args: Vec<String> = env::args().collect();
    if args.len()==3 {
    	let v: Vec<String> = get_directories(&args[1]);
    	let re = Regex::new(&args[2]).unwrap();
    	let nv: Vec<String> = get_matches(v, re);
    	for entry in nv{
    		println!("{}", entry);
    	}
    }
}

fn get_matches(paths: Vec<String>, pattern: Regex) -> Vec<String>{
	let mut v : Vec<String> = Vec::new();
	for entry in paths{
		if pattern.is_match(&entry){
			v.push(entry);
		}
	}
	v
}

 fn get_directories(dir: &String) -> Vec<String> {
 	let path = Path::new(&dir);
 	let mut v : Vec<String> = Vec::new();
 	for entry in fs::read_dir(path).expect("Unable to list"){
		let entry = entry.expect("Unable to list here");
		let npath = entry.path();
		if npath.is_dir() {
			let strng = npath.file_name().unwrap().to_string_lossy().into_owned();
			let mut nstr = String::new();
			nstr.push_str(&dir);
			nstr.push_str("/");
			nstr.push_str(&strng);
			let nv: Vec<String> = get_directories(&nstr);
			for each in nv{
				v.push(each);
			}
		}
		else {
			let strng = npath.file_name().unwrap().to_string_lossy().into_owned();
			let mut nstr = String::new();
			nstr.push_str(&dir);
			nstr.push_str("/");
			nstr.push_str(&strng);
			v.push(nstr);
		}
	}
	v
 }
