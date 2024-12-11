package com.klef.jfsd.springboot.sdp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.sdp.model.Aadhar;
import com.klef.jfsd.springboot.sdp.model.Cart;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;
import com.klef.jfsd.springboot.sdp.repository.AadharRepository;
import com.klef.jfsd.springboot.sdp.repository.CartRepository;
import com.klef.jfsd.springboot.sdp.repository.InvestorRepository;
import com.klef.jfsd.springboot.sdp.repository.MutualFundRepository;

@Service
public class InvestorServiceImpl implements InvestorService{

	@Autowired
	private InvestorRepository investorRepository;
	
	@Autowired
	private AadharRepository aadharRepository;
	
	@Autowired
	private MutualFundRepository mutualFundRepository;
	
	@Autowired 
	private CartRepository cartRepository;
	
	@Override
	public String Register(Investor investor) {
		
		String aadhar = investor.getProofOfIdentity();
		Optional<Aadhar> aadharOptional = aadharRepository.checkAadhar(aadhar, false);
	    
	    if (aadharOptional.isPresent()) {
	        investor.setVerified(true);
	    } else {
	        investor.setVerified(false); 
	    }
		 investorRepository.save(investor);
		 return "Investor Registered Successfully";
	}

	@Override
	public Investor checkLogin(String email, String password) {
		return investorRepository.checkInvestorLogin(email, password);
	}

	@Override
	public List<MutualFund> viewAllFunds() {
		return mutualFundRepository.findAll();
	}

	
	public void addToCart(Long investorId, Long fundId) {
        Cart cart = new Cart();
        cart.setInvestorId(investorId);
        cart.setFundId(fundId);
        cartRepository.save(cart);
    }

	@Override
	public List<Cart> viewCartById(Long id) {
		return cartRepository.findByInvestorId(id);
	}

	@Override
	public MutualFund viewFundById(long id) {
		return mutualFundRepository.findById((int) id).orElse(null);
	}

	@Override
	public String updateInvestor(Investor investor) {
		investorRepository.save(investor);
		return "Updates Succesffully";
	}

	@Override
	public String removeFromCart(long iid, long fid) {
		 cartRepository.deleteByInvestorIdAndFundId(iid, fid);
		 return "Removed from cart succcessfully";
	}
	

}
