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
-- Name: sales_forecast; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_forecast (
    sales_forecast_id character varying(20) NOT NULL,
    parent_sales_forecast_id character varying(20),
    organization_party_id character varying(20),
    internal_party_id character varying(20),
    custom_time_period_id character varying(20),
    currency_uom_id character varying(20),
    quota_amount numeric(18,2),
    forecast_amount numeric(18,2),
    best_case_amount numeric(18,2),
    closed_amount numeric(18,2),
    percent_of_quota_forecast numeric(18,6),
    percent_of_quota_closed numeric(18,6),
    pipeline_amount numeric(18,2),
    created_by_user_login_id character varying(255),
    modified_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_forecast OWNER TO ofbiz;

--
-- Name: sales_forecast pk_sales_forecast; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT pk_sales_forecast PRIMARY KEY (sales_forecast_id);


--
-- Name: sales4c_crt_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_crt_user ON sales_forecast USING btree (created_by_user_login_id);


--
-- Name: sales4c_cur_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_cur_uom ON sales_forecast USING btree (currency_uom_id);


--
-- Name: sales4c_int_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_int_party ON sales_forecast USING btree (internal_party_id);


--
-- Name: sales4c_mod_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_mod_user ON sales_forecast USING btree (modified_by_user_login_id);


--
-- Name: sales4c_org_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_org_party ON sales_forecast USING btree (organization_party_id);


--
-- Name: sales4c_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_parent ON sales_forecast USING btree (parent_sales_forecast_id);


--
-- Name: sales4c_time_per; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4c_time_per ON sales_forecast USING btree (custom_time_period_id);


--
-- Name: sls_frcst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_frcst_txcrts ON sales_forecast USING btree (created_tx_stamp);


--
-- Name: sls_frcst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_frcst_txstmp ON sales_forecast USING btree (last_updated_tx_stamp);


--
-- Name: sales_forecast sales4c_crt_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_crt_user FOREIGN KEY (created_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: sales_forecast sales4c_cur_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_cur_uom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: sales_forecast sales4c_int_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_int_party FOREIGN KEY (internal_party_id) REFERENCES party(party_id);


--
-- Name: sales_forecast sales4c_mod_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_mod_user FOREIGN KEY (modified_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: sales_forecast sales4c_org_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_org_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: sales_forecast sales4c_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_parent FOREIGN KEY (parent_sales_forecast_id) REFERENCES sales_forecast(sales_forecast_id);


--
-- Name: sales_forecast sales4c_time_per; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast
    ADD CONSTRAINT sales4c_time_per FOREIGN KEY (custom_time_period_id) REFERENCES custom_time_period(custom_time_period_id);


--
-- PostgreSQL database dump complete
--

