USE [Production]
GO

/****** Object:  Table [dbo].[resource_data]    Script Date: 7/3/2024 11:42:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[resource_data](
	[reservers_s] [int] IDENTITY(1,1) NOT NULL,
	[reported_date] [date] NULL,
	[fluid_name] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[block_name] [nvarchar](255) NULL,
	[pi_block_percentage] [float] NULL,
	[field_name] [nvarchar](255) NULL,
	[pi_field_percentage] [float] NULL,
	[iip_low] [float] NULL,
	[iip_best_] [float] NULL,
	[iip_high] [float] NULL,
	[rf_to_iip_low_percentage] [float] NULL,
	[rf_to_iip_best_percentage] [float] NULL,
	[rf_to_iip_high_percentage] [float] NULL,
	[eur_low] [float] NULL,
	[eur_best] [float] NULL,
	[eur_high] [float] NULL,
	[production_last_year] [float] NULL,
	[net_sales_last_year] [float] NULL,
	[own_use_last_year_mstb] [float] NULL,
	[injection_last_year_mstb] [float] NULL,
	[flare_last_year_mstb] [float] NULL,
	[impurities_last_year_mstb] [float] NULL,
	[shrinkage_last_year_mstb] [float] NULL,
	[cumulative_production] [float] NULL,
	[reserves_sales_1PD] [float] NULL,
	[reserves_sales_1PU] [float] NULL,
	[reserves_sales_1P] [float] NULL,
	[reserves_sales_2PD] [float] NULL,
	[reserves_sales_2PU] [float] NULL,
	[reserves_sales_2P] [float] NULL,
	[reserves_sales_3PD] [float] NULL,
	[reserves_sales_3PU] [float] NULL,
	[reserves_sales_3P] [float] NULL,
	[wdr_percentage] [float] NULL,
	[rtp_years] [float] NULL,
	[rrr_percentage] [float] NULL,
	[rf_to_eur_percentage] [float] NULL,
	[rrr_from_add_p1_percentage] [float] NULL,
	[rf_to_in_place_percentage] [float] NULL,
	[add_reserve_last_year_recoverable_1p_mstb] [float] NULL,
	[add_reserve_last_year_recoverable_2p_mstb] [float] NULL,
	[add_reserve_last_year_recoverable_3p_mstb] [float] NULL,
	[add_contingent_last_year_recoverable_1c_mstb] [float] NULL,
	[add_contingent_last_year_recoverable_2c_mstb] [float] NULL,
	[add_contingent_last_year_recoverable_3c_mstb] [float] NULL,
	[contingent_1C] [float] NULL,
	[contingent_2C] [float] NULL,
	[contingent_3C] [float] NULL,
	[remarks] [nvarchar](255) NULL,
	[sub_classification] [nvarchar](255) NULL,
	[delta_reserves_1p_mstb] [float] NULL,
	[delta_reserves_2p_mstb] [float] NULL,
	[delta_reserves_3p_mstb] [float] NULL,
	[delta_contingent_1c_mstb] [float] NULL,
	[delta_contingent_2c_mstb] [float] NULL,
	[delta_contingent_3c_mstb] [float] NULL,
	[structure_name] [nvarchar](255) NULL,
	[nsf_1p] [float] NULL,
	[nsf_2p] [float] NULL,
	[nsf_3p] [float] NULL,
	[nsf_1c] [float] NULL,
	[nsf_2c] [float] NULL,
	[nsf_3c] [float] NULL,
 CONSTRAINT [PK__tes1}__C5F9760ECC6865EC] PRIMARY KEY CLUSTERED 
(
	[reservers_s] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


