package com.klef.jfsd.springboot.sdp.service;

import java.util.List;

import com.klef.jfsd.springboot.sdp.model.Cart;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;

public interface InvestorService {
	public String Register(Investor investor);
	public Investor checkLogin(String email, String password);
	public String updateInvestor(Investor investor);
	
	public List<MutualFund> viewAllFunds();
	public MutualFund viewFundById(long id);
	
	
    public void addToCart(Long investorId, Long fundId) ;
    public List<Cart> viewCartById(Long id);
    public String removeFromCart(long iid,long fid);

}
