# -*- coding: utf-8 -*-
module ApplicationHelper
  def make_consulting_string(consulting)
    ccl_string = []
    ccl_string << "CCL" if consulting.med_ccl
    ccl_string << "LP" if consulting.med_lp
    ccl_string << "치아성형" if consulting.med_tooth

    ccl_string.join(", ")
  end
end
