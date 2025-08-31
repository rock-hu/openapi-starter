--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sales_opportunity; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity (
    sales_opportunity_id character varying(20) NOT NULL,
    opportunity_name character varying(100),
    description text,
    next_step text,
    next_step_date timestamp with time zone,
    estimated_amount numeric(18,2),
    estimated_probability numeric(18,6),
    currency_uom_id character varying(20),
    marketing_campaign_id character varying(20),
    data_source_id character varying(20),
    estimated_close_date timestamp with time zone,
    opportunity_stage_id character varying(20),
    type_enum_id character varying(20),
    created_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity OWNER TO ofbiz;

--
-- Name: sales_opportunity pk_sales_opportunity; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT pk_sales_opportunity PRIMARY KEY (sales_opportunity_id);


--
-- Name: sls_opprtnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprtnt_txcrts ON sales_opportunity USING btree (created_tx_stamp);


--
-- Name: sls_opprtnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprtnt_txstmp ON sales_opportunity USING btree (last_updated_tx_stamp);


--
-- Name: slsopp_crncy_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopp_crncy_uom ON sales_opportunity USING btree (currency_uom_id);


--
-- Name: slsopp_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopp_dtsrc ON sales_opportunity USING btree (data_source_id);


--
-- Name: slsopp_mktgcmpg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopp_mktgcmpg ON sales_opportunity USING btree (marketing_campaign_id);


--
-- Name: slsopp_stage; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopp_stage ON sales_opportunity USING btree (opportunity_stage_id);


--
-- Name: slsopp_typ_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopp_typ_enum ON sales_opportunity USING btree (type_enum_id);


--
-- Name: slsopp_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopp_usrlgn ON sales_opportunity USING btree (created_by_user_login);


--
-- Name: sales_opportunity slsopp_crncy_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT slsopp_crncy_uom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: sales_opportunity slsopp_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT slsopp_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: sales_opportunity slsopp_mktgcmpg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT slsopp_mktgcmpg FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: sales_opportunity slsopp_stage; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT slsopp_stage FOREIGN KEY (opportunity_stage_id) REFERENCES sales_opportunity_stage(opportunity_stage_id);


--
-- Name: sales_opportunity slsopp_typ_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT slsopp_typ_enum FOREIGN KEY (type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: sales_opportunity slsopp_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity
    ADD CONSTRAINT slsopp_usrlgn FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

