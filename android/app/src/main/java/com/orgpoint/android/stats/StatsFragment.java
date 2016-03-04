package com.orgpoint.android.stats;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.orgpoint.android.R;
import com.orgpoint.android.api.OrgPointService;
import com.orgpoint.android.api.ServiceGenerator;
import com.orgpoint.android.api.User;

import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class StatsFragment extends Fragment {

  @Bind(R.id.profile_name)
  TextView profileName;
  @Bind(R.id.email_address)
  TextView emailAddress;
  @Bind(R.id.status_time)
  TextView getRole;

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
  }

  @Nullable
  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {
    return inflater.inflate(R.layout.fragment_stats, container, false);
  }

  @Override
  public void onViewCreated(View view, Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
//    ButterKnife.bind(this, view);
    OrgPointService service = ServiceGenerator.getOrgPointService();
    Call<List<User>> call = service.fetchUsers();
    call.enqueue(new Callback<List<User>>() {
      @Override
      public void onResponse(Call<List<User>> call, Response<List<User>> response) {
      	
      }

      @Override
      public void onFailure(Call<List<User>> call, Throwable t) {

      }
    });
  }

  @Override
  public void onAttach(Context context) {
    super.onAttach(context);
  }

  public static StatsFragment getInstance(){
    return new StatsFragment();
  }
}
