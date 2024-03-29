import React, { useEffect, useState } from "react";
import { requestData } from "../../core/axios";

import "./styles.css";
import TotalRegistrations from "../../components/Dashboard/TotalRegistrations";
import MyResponsivePie from "../../components/Dashboard/UserDemographics";
import MyResponsiveBar from "../../components/Dashboard/ApplicationsStats";
import Spinner from "../../components/Spinnes";

const Statistics = () => {
  const [values, setValues] = useState({
    startups: 0,
    jobSeekers: 0,
    pendingApplications: 0,
    rejectedApplications: 0,
    totalRegisteredUsers: 0,
    leadingIndustry: "",
  });
  const [isLoading, setIsLoading] = useState(true);

  const getStatistics = async () => {
    const token = localStorage.getItem("token");
    const headers = {
      Authorization: token,
    };
    try {
      await requestData("admin/statistics", "get", null, headers).then(
        (res) => {
          setIsLoading(false);
          setValues(res);
        },
      );
    } catch (err) {
      alert(err.response.data.message);
    }
  };
  useEffect(() => {
    getStatistics();
  }, []);
  if (!isLoading) {
    return (
      <div className="content-container ">
        <TotalRegistrations
          totalRegisteredUsers={values.totalRegisteredUsers}
          leadingIndustry={values.leadingIndustry}
        />
        <div className="flex row " style={{ gap: 30 }}>
          <div className="userStats" style={{ height: 500, width: "40%" }}>
            <h2 style={{ color: "#326789" }}>Number of Users</h2>
            <MyResponsivePie
              jobSeekers={values.jobSeekers}
              startups={values.startups}
            />
          </div>
          <div className="userStats" style={{ height: 500, width: " 60% " }}>
            <h2 style={{ color: "#326789" }}>Number of Applications</h2>
            <MyResponsiveBar
              pending={values.pendingApplications}
              rejected={values.rejectedApplications}
            />
          </div>
        </div>
      </div>
    );
  } else {
    return <Spinner />;
  }
};

export default Statistics;
